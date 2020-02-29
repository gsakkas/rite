let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (fun __var_1__ ->
              (f b , f b) , b)


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (fun __var_1__ ->
              (f b , b) , b)


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (fun __var_1__ ->
              (b , f b) , b)


(* -------------------------------------- *)


(* bad

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), (not ((f b) = b))), b);;

*)

(* student fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans

(5,30)-(5,56)
fun x -> (x , f x = x)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)
