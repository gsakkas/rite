
let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand 0 1) = 0 then expr ^ "VarX" else expr ^ "Var"
    | 1 ->
        if (rand 0 1) = 0
        then expr ^ ("Sine(" ^ (((buildhelper 0 depth) - (1 expr)) ^ ")"))
        else expr ^ ("Cosine(" ^ (((buildhelper 0 depth) - (1 expr)) ^ ")")) in
  buildhelper (rand 0 4) depth "";;
