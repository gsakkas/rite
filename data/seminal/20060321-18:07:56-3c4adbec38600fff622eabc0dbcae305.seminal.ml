type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt
         | SaveHeap of string
         | RestoreHeap of string


type heap = heap_elt list
(* #################################################################### *)
and  heap_elt = H of (string*heap) | I of (string*int) 

(* ################################################################
###################################################################
########################### *)
let rec lookup h str =
  match h with
    [] -> 0 (* ############### *)
  | hd::tl -> 
  	match hd with
  	  H (s,h) -> if s=str then 0 else lookup tl str
  	| I (s,i) -> if s=str then i else lookup tl str

let update h str i = 
    I(str,i)::h
    

let rec interp_e (h:heap) (e:exp) =
 match e with
  Int i       ->i
 |Var str     -> lookup h str
 |Plus(e1,e2) ->(interp_e h e1)+(interp_e h e2)
 |Times(e1,e2)->(interp_e h e1)*(interp_e h e2)


(* ############################################################
#################################################################
######################################################
###################################################################
############## *)
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
  |SaveHeap str  -> H(str,h)::h
  |RestoreHeap str -> 
  	let rec find_heap h1 =
  	   match h1 with 
  	     [] -> []
  	   | hd::tl ->
  	      match hd with
  	        H(s,h_prime) -> if s=str then h_prime
  	        		else find_heap tl
  	      | I(s,i) -> if s=str then h else find_heap tl
  	 in find_heap h
  	      
  	  

let mt_heap = [] 

let interp_prog s = 
  lookup (interp_s mt_heap s) "ans"
  
  
(* ############################### *)  
 let test_heap = [I("a",0);
 		  H("b",[I("b1",4);
 			 H("d",[I("d0",10);
 				I("d1",11);
 				I("d2",12)]);
 			 I("b2",5)]);
 		  I("c",2)] 
   
  
  
   
   
let rec print_heap h =
  
  match h with 
    []->print_string("")
  | hd::tl ->
    
 let rec print_elt elt =
  match elt with
    H(s,hp) -> print_string(" ("^ s^", [") ; 
    	 (match hp with
    	  [] -> print_string("")
    	 | H(s1,hp1)::tl -> print_heap (hp1); print_heap tl
    	 | I(s1,i1)::tl -> print_string(" (" ^ s1 ^","^(string_of_int i1)^ ")");
    	 		   print_heap tl);
    	print_string("] )")
  | I(s,i) -> print_string(" ("^s ^ "," ^ (string_of_int i)^")")
  in   
    
    
    print_elt hd; 
    
    print_heap tl
  
let test_stmt = Assign("ans",Plus("c",Int(5)))
let test_stmt2 = SaveHeap("bob")
let test_stmt3 = RestoreHeap("c") (* #################### *)
let test_stmt4 = RestoreHeap("b2") (*doesn't return current heap###

################################################

###let _ = print_endline("ans: " ^ string_of_int(interp_prog test_stmt))
####
##
#####List.map print_heap_elt h###
##
let _ = print_heap test_heap 
   				  
##

 *)
