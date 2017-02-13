
exception Unimplemented
exception AlreadyDone

(*** part a ***)
(* ############################ *)
type move = Home | Forward of float | Turn of float | For of int*(move list)
(* ###############################################################
############ *)
type state = {cur_x:float ; cur_y:float ; cur_dir:float}

(* ###############################################################
############################ *)
let pi = acos(-1.0)
let unit_circle = 2.0 *. pi

(* ################################################## *)
let right = -1.5707963
let left = 1.57079632
let reverse = pi


(*** part b ***)
(* ############ *)
let makePoly sides len =
   if (sides = 0 ) then Forward 0.0
   else  (
     let rot = unit_circle /. (float sides) in
     let move_list = [Forward len;Turn rot] in
     
     For (sides, move_list)  
   )
        

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    (* ########################### *)
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(f)::tl -> loop tl (x +. (f*. (cos dir))) (y +. (f*. (sin dir))) dir
    			(((x +. (f *. (cos dir))),(y+.(f *. (sin dir))))::acc)
    | Turn(rot)::tl -> 
    	let new_dir = dir +. rot in
    	if (new_dir < 0.0) then (loop tl x y (new_dir +. unit_circle) acc)
    	else ( if (new_dir > unit_circle) then (loop tl x y (new_dir -. unit_circle) acc)
    	       else (loop tl x y new_dir acc)
    	     )  
    | For(i,lst)::tl -> 
    	let rec append_for_lst i acc=
    	  if (i=0) then acc
    	  else (append_for_lst (i-1) (lst@acc))
    	in loop ((append_for_lst i [])@tl) x y dir acc

  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)

let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  (* ########################### *)
  match movelist with
    [] -> raise AlreadyDone
  | Home::tl -> (tl,0.0,0.0,0.0)  
  | Forward(f)::tl -> (tl,(x+.(f*.(cos dir))),(y+.(f*.(sin dir))),dir)
  | Turn(rot)::tl->(tl,x,y,(dir+.rot))
  | For(i,lst)::tl->
  	let rec append_for_lst idx =
  	if (idx=0) then tl
  	else (lst@(append_for_lst (idx-1))) 
  	in
  	((append_for_lst i), x, y, dir)
  in
  let rec loop movelist x y dir acc =
   	match movelist with
   	  [] -> acc
   	| hd::tl -> let (lst,new_x,new_y,new_dir) = 
   			interpSmallStep movelist x y dir in
   		    if ((new_x <> x) || (new_y <> y)) then 
   		    (loop lst new_x new_y new_dir ((new_x,new_y)::acc))
   		    else (loop lst x y new_dir acc)
   	
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* #####################################################################
#############################################################################
##############################################################################
################################################################
################################################################# *)

(*** part f ***)

let rec interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = 
  	let cnt = List.length (fst f1) in
  	let first_trace = fst f1 in
  	(* ############################## *)
  	let f1_dir = snd f1 in
  	(*(List.nth f1 (cnt -1)) in*)
  	f2 (fst first_trace) (snd first_trace) f1_dir
  in
  match movelist with
    [] -> (fun x y dir -> ([], dir))
  | Home::tl -> 
  	let f1 = interpTrans tl in
  	(fun x y dir -> (((0.0,0.0)::(fst (f1 0.0 0.0 0.0))),
  				 (0.0 +. (snd (f1 0.0 0.0 0.0)))
  				)  
  	)
  | Forward(f)::tl -> 
  	let f1 = interpTrans tl in 
  		(fun x y dir -> 
  		  let x_coord = (x +. (f *. (cos dir))) in
  		  let y_coord = (y +. (f *. (sin dir))) in
  		  
  		  (( (x_coord,y_coord)::(fst (f1 x_coord y_coord dir))),
  			(dir +. (snd (f1 x_coord y_coord dir))))
  		)
  				
  				  
  | Turn(rot)::tl ->
  	let f1 = interpTrans tl in
  	fun x y dir -> ((fst (f1 x y (dir +. rot))),
  			(dir +. rot) )
 
 
  | For(i,lst)::tl -> 
     let f1 = interpTrans tl in
     let f_body = interpTrans lst in
     let rec loop i1 =
     	if (i1=0) then (f1)
     	else (compose f_body (loop (i - 1)))
     in
     loop i
  (* ########################### *)



(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog1 = [Forward 1.0; (makePoly 4 3.0); Home]
let example_logo_prog = [Forward 1.0;
			 Forward 0.0;
			 (* ##################### *)
 			 Forward 2.0;
			 Home;
			 Home;
			 Turn right; 
			 Forward 1.0]
let interpL_vs_S = [Forward 0.0;Home]

(* ####################################
################################### *)

let ansL = interpLarge example_logo_prog 
let ansS = interpSmall example_logo_prog 
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0)) 
let ansdirI = snd ((interpTrans example_logo_prog) 0.0 0.0 0.0)

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _ = 
  print_endline("Interp_large: ");
  pr ansL; print_newline (); 
  print_endline("Interp_small: ");
  pr ansS; print_newline (); 
  print_endline("Interp_trans: ");
  pr ansI; print_newline (); 
  print_endline("Interp_trans direction: " ^ (string_of_float ansdirI));

