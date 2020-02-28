LetG NonRec [(ConsPatG EmptyPatG EmptyPatG,AppG [EmptyG])] (ListG [EmptyG,EmptyG])
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
