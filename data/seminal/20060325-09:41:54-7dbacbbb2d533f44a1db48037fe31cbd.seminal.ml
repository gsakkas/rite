type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt

type node = IntNode of string * int
       | HeapNode of string * heap
and heap = node list

let saveheap h str = HeapNode(str,h)::h

let rec restoreheap h str = 
  match h with
    [] -> []
  |IntNode(s,i)::tl -> if s=str then h else restoreheap tl str
  |HeapNode(s,h2)::tl -> if s=str then h2 else restoreheap tl str

let rec lookup h str =
  match h with
    [] -> 0 (* ############### *)
  |IntNode(s,i)::tl -> if s=str then i else lookup tl str
  |HeapNode(s,h2)::tl -> if s=str then 0 else lookup tl str

let update h str i = IntNode(str,i)::h

let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Var str     ->let h2 = restoreheap h str in
                lookup h2 str
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
  |Assign(str,e) -> let h2 = update h str (interp_e h e) in
                    saveheap h2 str
  |While(e,s1) -> if (interp_e h e) <> 0
                  then let h2 = interp_s h s1 in
                       interp_s h2 s
                  else h

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"

(** testing helpers **)

let rec printheap h prefix = 
  match h with
    [] -> print_string "empty"
  | IntNode(s,i)::tl -> let _ = print_string ("heap " ^ (string_of_int prefix) ^ ": " ^ s ^ ": " ^ (string_of_int i) ^ "\n") in
                        printheap tl prefix
  | HeapNode(s,h2)::tl -> let _ = printheap h2 (prefix + 1) in
                          printheap tl prefix

let tests = Assign("foo", Plus(Int(3),Int(4)))

let h = interp_prog tests

let _ = printheap h 0