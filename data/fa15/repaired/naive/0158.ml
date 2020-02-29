let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (__var_1__ , b)


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (__fun_1__ __var_1__)


(* -------------------------------------- *)

let rec wwhile =
  fun (f , b) ->
    match f b with
    | (x , false) -> x
    | (y , true) -> wwhile (f , y)

let fixpoint =
  fun (f , b) ->
    wwhile (__var_1__ , __var_2__)


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
