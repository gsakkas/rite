type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt
         | SaveHeap of string
         | RestoreHeap of string
         
type heap = heapElement list
and heapElement = VarElement of (string * int)
               | Heap of (string * heap)

let rec lookup_raw h str =
  match h with
    [] -> VarElement(str,0) (* ############### *)
  | VarElement(s,i)::tl -> if s=str then VarElement(s,i) else lookup_raw tl str
  | Heap(s,newHeap)::tl -> if s=str then Heap(s,newHeap) else lookup_raw tl str

let lookup_var h str = 
  match lookup_raw h str with
    VarElement(_,i) -> i
  | Heap(_) -> 0

let update_raw (h:heap) (he:heapElement) = he::h

let update_heap h str = update_raw h (Heap(str, h))

let update_var h str i = update_raw h (VarElement(str, i))
  
let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Var str     ->lookup_var h str
 |Plus(e1,e2) ->(interp_e h e1)+(interp_e h e2)
 |Times(e1,e2)->(interp_e h e1)*(interp_e h e2)

let rec interp_s (h:heap) (s:stmt) =
  match s with
   Skip -> h
  |Seq(s1,s2) -> let h2 = interp_s h s1 in 
                 interp_s h2 s2
  |If(e,s1,s2) -> if (interp_e h e) <> 0
                  then interp_s h s1 
                  else interp_s h s2
  |Assign(str,e) -> update_var h str (interp_e h e)
  |While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h
  |SaveHeap(str) -> update_heap h str
  |RestoreHeap(str) -> (match lookup_raw h str with
                          VarElement(_) -> h
                        | Heap(_, newHeap) -> newHeap)

let mt_heap = [] 

let interp_prog s = 
  lookup_var (interp_s mt_heap s) "ans"

(**************************************************)
(* ############################################## *)
(**************************************************)

let test s = print_int (interp_prog s); print_newline
  
let prog = Seq(Seq(SaveHeap("foo"), Assign("ans", 1)), RestoreHeap("foo"))

let _ = test prog


