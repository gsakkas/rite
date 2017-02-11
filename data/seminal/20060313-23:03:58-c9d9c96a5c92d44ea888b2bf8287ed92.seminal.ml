type heap = (string * intorheap) list
and intorheap = Int of int | Heap of heap

type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
       | Heap of heap
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt
         | SaveHeap of string
         | RestoreHeap of string

let rec getheap h str =
  match h with
  | []			-> []
  | (s,ih)::tl	-> if s=str
					then ih
					else getheap tl str

let update h str ih = (str,ih)::h

let rec lookup h str =
  match h with
  | []			-> 0 (* ############### *)
  | (s,ih)::tl	-> if s=str
					then match ih with
						| Int i		-> i
						| Heap h1	-> 0
					else lookup tl str
					
let rec interp_e (h:heap) (e:exp) =
 match e with
 | Int i		-> i
 | Var str		-> lookup h str
 | Plus(e1,e2)	-> (interp_e h e1)+(interp_e h e2)
 | Times(e1,e2)	-> (interp_e h e1)*(interp_e h e2)
 | Heap h1		-> 0

let rec interp_s (h:heap) (s:stmt) =
  match s with
  | Skip			-> h
  | Seq(s1,s2)		-> let h2 = interp_s h s1 in 
						interp_s h2 s2
  | If(e,s1,s2)		-> if (interp_e h e) <> 0
						then interp_s h s1 
						else interp_s h s2
  | Assign(str,e)	-> update h str (interp_e h e)
  | While(e,s1)		-> if (interp_e h e) <> 0
						then let h2 = interp_s h s1 in
						interp_s h2 s
						else h
  | SaveHeap str	-> update h str h
  | RestoreHeap str	-> if (lookup h str) <> 0
						then h
						else (getheap h str)

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"
  
  

(*Change the large-step IMP interpreter (provided in lecture 2; see imp.ml) to support saving and
restoring entire heaps. In particular, implement two new statement forms:
 saveheap str is like assignment except insted of putting an integer in str , it puts the (entire)
current heap.
 restoreheap str takes the heap stored in str and makes it the current heap.
A heap variable can store an int or a heap, so we need these cheating rules:
 If x holds a heap, then the expression x evaluates to 0.
 If x holds an int, then the statement restoreheap x has no effect (it is like a skip).
Hints:
 This problem does not require much programming.
 Change the type heap to be mutually recursive with a new datatype*)
