CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])
match randNum3 with
| 1 -> buildSine (buildOp1 (build (rand , depth - 1)))
| 2 -> buildCosine (buildOp1 (build (rand , depth - 1)))
match $x with
| v -> x (a v)
match $x with
| v -> x (a v)
match $x with
| v -> x (a v)
match n with
| n -> [] @ [n mod 10]
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match xs with
| hd :: tl -> f (f hd hd) tl
match r with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
