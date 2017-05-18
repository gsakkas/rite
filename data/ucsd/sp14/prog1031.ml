
let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    let temprand = makeRand (0, 1) in
    match num with
    | 0 -> if temprand = 0 then expr ^ "VarX" else expr ^ "VarY"
    | 1 ->
        if (makeRand (0, 1)) = 0
        then expr ^ ("Sine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (makeRand (0, 1)) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (rand - 1) (depth - 1) expr) ^
                  ("+" ^ ((buildhelper (rand - 1) (depth - 1) expr) ^ ")/2)"))))
        else
          expr ^
            ((buildhelper (rand - 1) (depth - 1) expr) ^
               ("*" ^ (buildhelper (rand - 1) (depth - 1) expr)))
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (rand - 2) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (rand - 2) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (rand - 2) (depth - 1) expr) ^
                            (":" ^
                               ((buildhelper (rand - 2) (depth - 1) expr) ^
                                  ")")))))))) in
  buildhelper rand depth "";;
