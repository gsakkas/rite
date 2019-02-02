type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt
         | SaveHeap of string
         | RestoreHeap of string

type heap = (string * storage) list
and storage = Int2 of int | Heap2 of heap

let rec lookup h str =
  match h with
    [] -> 0 (* ############### *)
  |(s,i)::tl -> if s=str then i else lookup tl str

let update h str i = (str,i)::h

let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Plus(e1,e2) ->(interp_e h e1)+(interp_e h e2)
 |Times(e1,e2)->(interp_e h e1)*(interp_e h e2)
 |Var str     ->0
(* ######################################
##################################
############################### *)

let rec interp_s (h:heap) (s:stmt) =
  match s with
   Skip -> h
  |Seq(s1,s2) -> let h2 = interp_s h s1 in 
                 interp_s h2 s2
  |If(e,s1,s2) -> if (interp_e h e) <> 0
                  then interp_s h s1 
                  else interp_s h s2
  |Assign(str,e) -> update h str (interp_e h e)
  |While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h
  |SaveHeap(str) -> update h str h
  |RestoreHeap(str) -> match lookup h str with
                       | Int(_) -> 0
                       | Heap(v) -> v

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"
