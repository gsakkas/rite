
type 'a set =
  | Set of 'a list;;

type binop =
  | Plus;;

type expr =
  | Const of int
  | Var of string
  | Bin of expr* binop* expr
  | Let of string* expr* expr
  | App of expr* expr
  | Fun of string* expr;;

let add x s = match s with | Set l -> Set (x :: l);;

let del x s = match s with | Set l -> Set (List.filter (fun z  -> z != x) l);;

let e1 = Bin ((Const 1), Plus, (Const 2));;

let e2 =
  Let
    ("x", (Const 1),
      (Let ("y", (Const 2), (Bin ((Var "x"), Plus, (Var "y"))))));;

let empty = Set [];;

let union s1 s2 =
  match s2 with
  | Set x2s -> List.fold_left (fun s  -> fun x  -> add x s) s1 x2s;;

let rec free e =
  match e with
  | Var x -> add x empty
  | Const n -> empty
  | Bin (e1,op,e2) -> let f1 = free e1 in let f2 = free e2 in union f1 f2
  | App (e1,e2) -> let f1 = free e1 in let f2 = free e2 in union f1 f2
  | Let (x,e1,e2) ->
      let f1 = free e1 in let f2 = free e2 in del x (union (f1 f2))
  | Fun (x,e1) -> del x (free e1);;
