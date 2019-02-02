type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt

type heapElement = 
      IntEntry of (string * int)
    | HeapEntry of (string * heap)
      and heap = ((heapElement) list)

(*type heap = (string * int) list*)

let rec lookup h str =
  match h with
    [] -> 0 (* ############### *)
  |hd::tl -> 
      match hd with
      | IntEntry (s, i)->if s=str then i else lookup tl str
      | HeapEntry(s, h)->if s=str then h else lookup tl str

let update h str i = (str,i)::h

let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Var str     ->lookup h str
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
  |Assign(str,e) -> update h str (interp_e h e)
  |While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"
