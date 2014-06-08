/* Normalization consists of turning a nested AST into a flatter form with
   reduced complexity and a simpler API. For example, the following code:

     (let (x 1
           y 3.14)
       (if (> x 5)
           true
           false))

   Would normalize to:

     - Block:
       type: let
       contents:
         - x <- 1
         - y <- 3.14
         - reg0 <- gt x 5
         - reg1 <- if reg0 true false

   Block syntax is very similar to LLVM IR, but remains an object rather than
   text. */

enum BlockType { Instruction, Let, NamedFunction, Lambda };

struct Block {
  BlockType type;
  std::vector<Block> contents;
};
