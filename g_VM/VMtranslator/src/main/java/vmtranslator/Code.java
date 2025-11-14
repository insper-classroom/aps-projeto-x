/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada (sem extensão)
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes
    int cont = 0;

    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     */
    public void writeArithmetic(String command) {

        if ( command == null || command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        // comentário para debug
        commands.add(String.format("; %d - %s", lineCode++, command.toUpperCase()));

        // ---------- BINARY OPS: add, sub, and, or ----------
        if(command.equals("add") || command.equals("sub") ||
           command.equals("and") || command.equals("or")) {

            // pop y into %D
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");   // %A = SP
            commands.add("decw %A");         // %A = SP - 1  (address of y)
            commands.add("movw (%A), %D");   // D = y

            // address of x is SP - 2
            commands.add("decw %A");         // %A = SP - 2 (address of x)

            // perform operation and store result in D
            if (command.equals("add")) {
                commands.add("addw (%A), %D, %D"); // D = x + y
            } else if (command.equals("sub")) {
                commands.add("subw (%A), %D, %D"); // D = x - y
            } else if (command.equals("and")) {
                commands.add("andw (%A), %D, %D"); // D = x & y
            } else { // or
                commands.add("orw (%A), %D, %D");  // D = x | y
            }

            // write D into address %A (position of x)
            commands.add("movw %D, (%A)");

            // update SP = SP - 1 (we popped two and pushed one)
            // current %A == oldSP - 2; newSP = oldSP - 1 -> %A + 1
            commands.add("incw %A");           // %A = oldSP - 1
            commands.add("movw %A, %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        // ---------- UNARY OPS: neg, not ----------
        } else if (command.equals("neg") || command.equals("not")) {
            // SP - 1 points to top; apply unary op there
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");   // %A = SP
            commands.add("decw %A");         // %A = SP - 1 (top)
            commands.add("movw (%A), %D");   // D = *top
            if (command.equals("neg")) {
                // use single-operand neg
                commands.add("negw %D");
            } else {
                commands.add("notw %D");
            }
            commands.add("movw %D, (%A)");

        // ---------- COMPARISONS: eq, gt, lt ----------
        } else if (command.equals("eq") || command.equals("gt") || command.equals("lt")) {

            int lblTrueNum = lineCode++;
            int lblEndNum = lineCode++;
            String lblTrueName = "TRUE_" + lblTrueNum;
            String lblEndName  = "END_" + lblEndNum;

            // pop y into %D
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");   // %A = SP
            commands.add("decw %A");         // %A = SP - 1 (address of y)
            commands.add("movw (%A), %D");   // D = y

            // %A = SP - 2 (address of x)
            commands.add("decw %A");

            // compute D = x - y  (using subw with memory operand)
            // (%A) is x, %D is y -> subw (%A), %D, %D  => D = x - y
            commands.add("subw (%A), %D, %D");

            // conditional jump to TRUE label based on D
            commands.add("leaw $" + lblTrueName + ", %A");
            if (command.equals("eq")) {
                commands.add("jeqw %D, %A");   // jump if D == 0
            } else if (command.equals("gt")) {
                commands.add("jgtw %D, %A");   // jump if D > 0
            } else {
                commands.add("jltw %D, %A");   // jump if D < 0
            }

            // FALSE case: store 0 into x (address SP - 2)
            // recompute address SP - 2 to be safe
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");         // %A = SP - 2
            // load 0 into %D (avoid negative immediates)
            commands.add("leaw $0, %A");
            commands.add("movw %A, %D");
            commands.add("movw %D, (%A)");   // *x = 0

            // jump to END
            commands.add("leaw $" + lblEndName + ", %A");
            commands.add("jmp");
            commands.add("nop");

            // TRUE label: write -1 into *x  (generate -1 from 0 by decrement)
            commands.add(lblTrueName + ":");
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");         // %A = SP - 2
            // %D = 0
            commands.add("leaw $0, %A");
            commands.add("movw %A, %D");
            // %D = %D - 1  -> -1
            commands.add("decw %D");
            commands.add("movw %D, (%A)");   // *x = -1

            // END label
            commands.add(lblEndName + ":");
            // update SP = SP - 1
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %D");
            commands.add("decw %D");
            commands.add("leaw $SP, %A");
            commands.add("movw %D, (%A)");

        } else {
            // comando não tratado
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);
    }

    /**
     * writePushPop
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command == null || command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local") ||
                       segment.equals("argument") ||
                       segment.equals("this") ||
                       segment.equals("that")) {

                String base = "";
                if (segment.equals("local")) base = "LCL";
                if (segment.equals("argument")) base = "ARG";
                if (segment.equals("this")) base = "THIS";
                if (segment.equals("that")) base = "THAT";

                // D = index
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A, %D");

                // base address into %A
                commands.add("leaw $" + base + ", %A");
                commands.add("movw (%A), %A");    // %A = base

                // D = base + index  (D = address target)
                commands.add("addw %D, %A, %D");

                // save address in R13
                commands.add("leaw $R13, %A");
                commands.add("movw %D, (%A)");

                // pop stack top into D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");

                // store D into *R13
                commands.add("leaw $R13, %A");
                commands.add("movw (%A), %A");   // %A = target address
                commands.add("movw %D, (%A)");

                // update SP = SP - 1
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("static")) {
                String var = this.filename + "." + index;
                // pop into D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                // store into static var
                commands.add("leaw $" + var + ", %A");
                commands.add("movw %D, (%A)");
                // update SP
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("temp")) {
                int addr = 5 + index;
                // pop into D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                // store into RAM[addr]
                commands.add("leaw $" + addr + ", %A");
                commands.add("movw %D, (%A)");
                // update SP
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("pointer")) {
                String ptr = (index==0) ? "THIS" : "THAT";
                // pop into D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                // store into ptr
                commands.add("leaw $" + ptr + ", %A");
                commands.add("movw %D, (%A)");
                // update SP
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %D");
                commands.add("decw %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");
            }

        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                // D = index
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A, %D");
                // push D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");   // %A = SP
                commands.add("movw %D, (%A)");
                // SP++
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("local") ||
                       segment.equals("argument") ||
                       segment.equals("this") ||
                       segment.equals("that")) {

                String base = "";
                if (segment.equals("local")) base = "LCL";
                if (segment.equals("argument")) base = "ARG";
                if (segment.equals("this")) base = "THIS";
                if (segment.equals("that")) base = "THAT";

                // D = index
                commands.add("leaw $" + index + ", %A");
                commands.add("movw %A, %D");
                // base value in %A
                commands.add("leaw $" + base + ", %A");
                commands.add("movw (%A), %A");    // %A = base
                // address = base + index -> D
                commands.add("addw %D, %A, %D");
                // load from address in D
                commands.add("movw %D, %A");     // %A = address target
                commands.add("movw (%A), %D");   // D = *(base+index)
                // push D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
                // SP++
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("static")) {

                String var = this.filename + "." + index;
                // D = var
                commands.add("leaw $" + var + ", %A");
                commands.add("movw (%A), %D");
                // push D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
                // SP++
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("temp")) {
                int addr = 5 + index;
                // D = RAM[addr]
                commands.add("leaw $" + addr + ", %A");
                commands.add("movw (%A), %D");
                // push D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
                // SP++
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");

            } else if (segment.equals("pointer")) {
                String ptr = (index==0) ? "THIS" : "THAT";
                // D = *ptr
                commands.add("leaw $" + ptr + ", %A");
                commands.add("movw (%A), %D");
                // push D
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
                // SP++
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A");
                commands.add("movw %D, (%A)");
            }
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Inicialização (bootstrap)
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    public void writeLabel(String label) {
        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );
    }

    public void writeGoto(String label) {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));
    }

    public void writeIf(String label) {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Goto Condicional", lineCode++));
    }

    public void writeCall(String functionName, Integer numArgs) {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));
    }

    public void writeReturn() {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));
    }

    public void writeFunction(String functionName, Integer numLocals) {
        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));
    }

    public void vmfile(String file) {
        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);
    }

    // grava as instruções em Assembly no arquivo de saída
    public void write(String[] stringArray) {
        for (String s: stringArray) {
            this.outputFile.println(s);
        }
    }

    // fecha o arquivo de escrita
    public void close() throws IOException {
        this.outputFile.close();
    }

}
