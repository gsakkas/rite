
exception Unimplemented
exception AlreadyDone

(*** part a ***)
type move = Home | Forward of float
 	    | Turn of float | For of int * (move)list


(*** part b -- return move***)
let makePoly sides len =
  let turnAmount = 2.0 in (* ##################### *)
  let rec makePolyHelp sidesLeft turn =
    match sidesLeft with
      0 -> []
    | 1 -> Home::makePolyHelp 0 true
    | n -> 
        if turn = true
        then 
          Turn(turnAmount)::makePolyHelp sidesLeft false
        else
        (
          let decSidesLeft = sidesLeft - 1 in
		  Forward(len)::makePolyHelp decSidesLeft true
	    )
  in
  if sides < 3
  then
    Home
  else
    For(sides, makePolyHelp sides false)
    

(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 dir ((0.0,0.0)::acc)
    | Forward f::tl -> 
          let newX = x +. ( f *. (cos dir) ) in
          let newY = y +. ( f *. (sin dir) ) in
          loop tl newX newY dir ((newX,newY)::acc)
    | Turn f::tl -> 
          let newDir = f +. dir in
          loop tl x y newDir acc
    | For (il, ml)::tl -> 
          if il > 0
          then
            let ild = il - 1 in
            let newMlTemp = For(ild, movelist)::tl in
            let newMl = List.append ml newMlTemp in
            loop newMl x y dir acc
          else  
            loop tl x y dir acc
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise AlreadyDone
  | Home::tl -> tl, 0.0, 0.0, 0.0
  | Forward f::tl -> 
          let newX = x +. ( f *. (cos dir) ) in
          let newY = y +. ( f *. (sin dir) ) in
          tl, newX, newY, dir
  | Turn f::tl -> 
          let newDir = f +. dir in
          tl, x, y, newDir
  | For (il, ml)::tl -> 
          let ild = il - 1 in
          let newMlTemp = For(ild, movelist)::tl in
          let newMl = List.append ml newMlTemp in
          newMl, x, y, dir
  in
  let rec loop movelist x y dir acc =
  match movelist with
    [] -> acc
  | _  ->
          let ret = interpSmallStep movelist x y dir in
          match ret with
            newList, retX, retY, retDir ->
                  if retX <> x || retY <> y
                  then
                    loop newList retX retY retDir ((retX, retY)::acc)
                  else
                    loop newList x y retDir acc
            
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* 
######################################################################
#############################################################################
##########################################
 *)

(*** part f ***)
let interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = raise Unimplemented (* ######################### *)
  in
  match movelist with
    [] -> (fun x y dir -> [(x,y)], dir)
  | Home::tl -> (fun x y dir -> (x,y)::(0.0,0.0),dir )
  | Forward f::tl -> raise Unimplemented
  | Turn f::tl -> raise Unimplemented
  | For (il, ml)::tl -> raise Unimplemented

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)
let example_logo_prog = raise Unimplemented
let ansL = interpLarge example_logo_prog
let ansS = interpSmall example_logo_prog
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))

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

