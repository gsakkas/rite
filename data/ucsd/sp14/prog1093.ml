
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildCosine (buildhelper 0 (depth - 1) expr)
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (num - 1) (depth - 1) expr) ^
                  ("+" ^ ((buildhelper (num - 1) (depth - 1) expr) ^ ")/2)"))))
        else
          expr ^
            ((buildhelper (num - 1) (depth - 1) expr) ^
               ("*" ^ (buildhelper (num - 1) (depth - 1) expr)))
    | 3 -> expr ^ (buildhelper (num - 1) depth expr)
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (num - 2) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (num - 2) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (num - 2) (depth - 1) expr) ^
                            (":" ^
                               ((buildhelper (num - 2) (depth - 1) expr) ^
                                  ")")))))))) in
  let num = rand (1, 4) in buildhelper num depth "";;
