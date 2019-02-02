
exception Unimplemented
exception AlreadyDone

(*** part a ***)
(* ############################ *)
type move = Home | Forward of float | Turn of float | For of int*list

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
let makePoly sides len =
   if (sides = 0 ) then (raise Division_by_zero)
   else  (
     let rot = unit_circle /. (float sides) in
     let rec loop x y acc side_count =
        if (side_count=sides) then []
        else let new_x = x +. (len *. (cos acc)) in
             let new_y = y +. (len *. (sin acc)) in
             (new_x,new_y):: (loop new_x new_y (acc +. rot) (side_count +1))
     in loop 0.0 0.0 0.0 0        
   )
        
           
(*
###################################
#############
#################
#############################
###############################################
###############################################
*)


(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    (* ########################### *)
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(f)::tl -> loop tl (x +. (f*. (cos dir))) (y +. (f*. (sin dir))) dir
    			(((x +. (f *. (cos dir))),(y+.(f *. (sin dir))))::acc)
    | Turn(rot)::tl -> loop tl x y (dir +. rot) acc
    | For(i,lst)::tl -> 
    	let append_for_lst i acc=
    	  if (i=0) then acc
    	  else (append_for_lst (i-1) (lst::acc))
    	in loop ((append_for_lst i [])::tl) x y dir acc

  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
(*
##############################################################
#############################################################################
#####################
#############################
#################################### *)
  (* ########################### *)
(* ###
#####################################
#######################
#####
##################################################
*)
(*** part e ***)

(* ##################################################################### *)

(*** part f ***)
(*
###############################################################################
######################################### *) (* ######################### *)
 (* ##
#####################
#############################
################################### *)
  (* ########################### *)

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = [Forward 1.0;Turn right; Home; For [7;15] ;Forward 2.0]
let ansL = interpLarge example_logo_prog
(* ######################################## *)
(* ######################################################################### *)

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _ = 
  pr ansL; print_newline (); 
(* ########################### *)
 (* ########################## *)

