
exception Unimplemented
exception AlreadyDone

let pi = 3.1415926
let pi2 = 2 * pi

(*** part a ***)
type move = Home | Forward of float | Turn of float | For of (int * move) list

(*** part b ***)
let makePoly sides len = []

(*** part c ***)
(*let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> raise Unimplemented
    | Home::tl -> raise Unimplemented
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])
##
################
##
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented  
  in
  let rec loop movelist x y dir acc =
    raise Unimplemented
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])
##
################

###modify this comment: note, can be done just by reading the assignment###

################
##
let interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = raise Unimplemented  *** suggested helper function ****
  in
  match movelist with
    [] -> raise Unimplemented
  | Home::tl -> raise Unimplemented
##

#######################################

###you do not have to use this "testing" code, but you might find it useful###
###no need to change more than example_logo_prog###
#############################################
########################################
########################################
#########################################################################
################
################
############
#################
################################################################################
###########

########
#############################
############################
#############################

## *)
