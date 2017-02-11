(* 
#################
#####################
################
 *)

exception Unimplemented
exception AlreadyDone

let pi = 4.0 *. atan 1.0

(*** part a ***)
type move = Home | Forward of float | Turn of float | For of (int * (move list))

(*** part b ***)
(* ################################################ *)
let makePoly sides len = For(sides, (Forward(len)::[Turn(2.0 *. pi /. float_of_int(sides))]))

(*** part c ***)

(* ################### *)
let forwardX x d f = x +. (f *. cos d)
let forwardY y d f = y +. (f *. sin d)
let turnD d1 d2 = mod_float (d1 +. d2) (2.0 *. pi)

let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 0.0 ((0.0,0.0)::acc)
    | Forward(f)::tl -> loop 
                          tl 
                          (forwardX x dir f)
                          (forwardY y dir f)
                          dir 
                          (((forwardX x dir f), (forwardY y dir f))::acc)
    | Turn(f)::tl -> loop
                       tl
                       x
                       y
                       (turnD dir f)
                       acc
    | For(0,lst)::tl -> loop tl x y dir acc
    | For(i,lst)::tl -> loop (lst @ (For(i-1, lst)::tl)) x y dir acc
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
  [] -> raise AlreadyDone
  | Home::tl -> (tl, 0.0, 0.0, 0.0)
  | Forward(f)::tl -> (tl, (forwardX x dir f), (forwardY y dir f), dir)
  | Turn(f)::tl -> (tl, x, y, turnD dir f)
  | For(0,lst)::tl -> (tl, x, y, dir)
  | For(i,lst)::tl -> ((lst @ (For(i-1,lst)::tl)), x, y, dir)
  in
  let rec loop movelist x y dir acc =
    if ([] = movelist)
    then acc
    else let (newlst,newx,newy,newdir) = interpSmallStep movelist x y dir in
      if ((newx <> x) || (newy <> y))
      then (* #################### *)
        loop newlst newx newy newdir ((newx,newy)::acc)
      else (* ######################### *)
        loop newlst x y newdir acc
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* 
###############################################################################
##################################################################
#############################################################################
###############################################################################
######################
##
################################################################################
##############################################################################
###########################################################################
###########################
##
###########################################################################
##
#############################################################################
###########################################################################
#######################################################################
###########################################################################
 *)

(*** part f ***)
let rec interpTrans movelist : float->float->float-> (float * float) list * float= 
  let move_with_trace x y d restFun =
    let (mvList, newDir) = restFun x y d in
    (((x,y)::mvList),newDir) in
  let move_without_trace x y d restFun =
    let (mvList, newDir) = restFun x y d in
    (mvList,newDir) in
  let compose f1 f2 = fun x y d -> 
    let (mvList, myDir) = f1 x y d in
    match mvList with
      [] -> f2 x y myDir
    | lst -> let (mvList2, newDir) = f2 
                                      (fst (List.nth lst ((List.length lst)-1)))
                                      (snd (List.nth lst ((List.length lst)-1)))
                                      myDir in
                             ((mvList @ mvList2), newDir)
    in
  match movelist with
    [] -> (fun _ _ d -> ([], d))
  | Home::tl -> let f1 = interpTrans tl in
                (fun _ _ _ -> move_with_trace 0.0 0.0 0.0 f1)
  | Forward(f)::tl -> let f1 = interpTrans tl in
                      (fun x y d -> 
                        let myX = forwardX x d f in
                        let myY = forwardY y d f in
                        move_with_trace myX myY d f1)
  | Turn(f)::tl -> let f1 = interpTrans tl in
                   (fun x y d ->
                     let myD = turnD d f in
                     move_without_trace x y myD f1)
  | For(n,body)::tl -> let f1 = interpTrans body in
                       let f2 = interpTrans tl in
                       (fun x y d -> 
                         let rec loop i = 
                           if (i <= 0) (* ################ *)
                           then f2
                           else compose f1 (loop (i-1)) in
                         move_without_trace x y d (loop n))

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = [makePoly 10 1.0]
let ansL = interpLarge example_logo_prog
let ansS = interpSmall example_logo_prog
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))

let _ = 
  let compare_float_pairs acc x y = 
    (acc && 
     ((abs_float (fst x -. fst y)) < 0.0001) &&
     ((abs_float (snd x -. snd y)))) in
  if ((List.fold_left2 compare_float_pairs true ansL ansS) && 
      (List.fold_left2 compare_float_pairs true ansS ansI))
  then print_string "Match!\n"
  else print_string "Mismatch!\n"

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl


let _ = 
  pr ansL; print_newline (); 
  pr ansS; print_newline ();
  pr ansI; print_newline ();
