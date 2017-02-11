exception Unimplemented

type exp = Int of int 
         | Var of string 
         | Plus of exp * exp 
         | Times of exp * exp

type stmt = Skip 
          | Assign of string * exp
          | Seq of stmt * stmt 
          | If of exp * stmt * stmt
          | While of exp * stmt
          | Saveheap of string
          | Restoreheap of string

(*
################################
#######################################################################################################################
*)
type heapEntry = HInt of int
               | Heap of heap
and
heap = (string * heapEntry) list

let rec lookup h str =
  match h with
  |[]        -> HInt(0) (* ############### *)
  |(s,v)::tl -> 
     if s=str 
     then v
     else lookup tl str

let update h str v = (str,v)::h

let rec interp_e (h:heap) (e:exp) =
  match e with
  | Int i       -> i
  | Var str     ->
     (
      let x = lookup h str in
      match x with
      | HInt(i) -> i
      | Heap(h) -> 0
     )
  | Plus(e1,e2) ->(interp_e h e1)+(interp_e h e2)
  | Times(e1,e2)->(interp_e h e1)*(interp_e h e2)

let rec interp_s (h:heap) (s:stmt) =
  match s with
  | Skip -> h
  | Seq(s1,s2) -> let h2 = interp_s h s1 in 
                 interp_s h2 s2
  | If(e,s1,s2) -> if (interp_e h e) <> 0
                  then interp_s h s1 
                  else interp_s h s2
  | Assign(str,e) -> update h str (HInt(interp_e h e))
  | While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h
  | Saveheap(str) -> update h str (Heap(h))
  | Restoreheap(str) -> 
      let x = lookup h str in
      match x with
      | HInt(i)    -> h
      | Heap(hnew) -> hnew 

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"


(*** Function Tests ***)
let rec print_heap h p =
  let printHE he = 
    match he with
    | (s,HInt(i))    -> print_endline (s^" = "^(string_of_int i))
    | (s,Heap(hnew)) -> (
                          print_endline (s^" = (");
                          print_heap h (p^" ");
                          print_endline ")";
                        )
  in
  List.iter printHE h

let rec stmtsToSeq stmts = 
  match stmts with
  | a::b::[]    -> Seq(a,b)
  | a::b::lst   -> Seq(a,Seq(b, stmtsToSeq(lst)))
  | a::[]       -> a
  | []		-> Skip

let stmts = 
  [
    Assign("a", Int(1));
    Assign("b", Int(2));
    Saveheap("c");
    Assign("b", Int(3));
    Saveheap("d");
    Assign("a", Int(5));
    Restoreheap("d");
    Restoreheap("a");
  ]

let _ = print_heap (stmtsToSeq stmts)
