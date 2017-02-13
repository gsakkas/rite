exception Unimplemented
exception AlreadyDone
exception InvalidAngle
let pi = 4.0 *. atan 1.0

let rec loopFor moves lst index acc2 =
if (index = (moves-1)) then
   acc2
else
   loopFor moves lst (index+1) ((List.nth lst index)::acc2)
	
(*** part a ***)
type move = 
    Home
  | Forward of float
  | Turn of float
  | For of int * move list

(*** part b ***)
let makePoly sides len =
  let angle = pi-.((pi*.(float_of_int (sides-2)))/.(float_of_int sides)) in
  let rec createMoveList moves acc =
    if moves = sides
    then 
      acc
    else 
       (createMoveList (moves+1) (Forward(len)::Turn(angle)::acc))in
  let moveList = createMoveList 0 [] in 
    For((sides*2), moveList)
(*** part c ***)
let interpLarge (movelist : move list) : (float*float) list = 
  let rec loop movelist x y dir acc =
    match movelist with
      [] -> acc
    | Home::tl -> loop tl 0.0 0.0 dir ((0.0,0.0)::acc)
    | Turn(newDir)::tl -> 
	loop tl x y (dir+.newDir) acc
    | For(moves, lst)::tl -> 
	let loopList = (loopFor moves lst 0 []) in
	let loopList2 = List.append loopList tl in
	loop loopList2 x y dir acc
    | Forward(len)::tl -> 
	let xLen = (len*.(cos dir)) in
	let yLen = (len*.(sin dir)) in 
	loop tl (x+.xLen) (y+.yLen) dir ((x+.xLen, y+.yLen)::acc)	  
  in List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part d ***)
let interpSmall (movelist : move list) : (float*float) list = 
  let interpSmallStep movelist x y dir : move list * float * float * float = 
  match movelist with
    [] -> raise AlreadyDone
   | Home::tl -> (tl, 0.0, 0.0, dir)
   | Turn(newDir)::tl -> (tl, 0.0,0.0, newDir)
   | For (moves, lst)::tl -> 
	let loopList = (loopFor moves lst 0 []) in
	let loopList2 = List.append loopList tl in
	(loopList2,x,y,dir)
   | Forward(len)::tl ->
        let xLen = (len *.(cos dir)) in
        let yLen = (len *.(sin dir)) in
        (tl,(x+.xLen),(y+.yLen),dir)
  in
  let rec loop movelist x y dir acc =
   let step = interpSmallStep movelist x y dir in
   match step with
   (ml, newX, newY, dir) -> 
   match ml with 
   [] ->acc
   |_  ->loop ml newX newY dir ((newX, newY)::acc)
  in 
  List.rev (loop movelist 0.0 0.0 0.0 [(0.0,0.0)])

(*** part e ***)

(* ########################################################
######################################################
#######################################################
############################################################
#############################################################
###############################################################
############################
*)

(*** part f ***)
let rec interpTrans movelist : float->float->float-> (float * float) list * float= 
  let compose f1 f2 = 
    (fun (x:float) (y:float) (dir:float)-> 
      let resp = f1 x y dir in
      let locList = fst resp in
      let arg = List.nth locList ((List.length locList)-1) in
      let resp2 = f2 (fst arg) (snd arg) (snd resp) in
	  match locList with
	     [] ->((fst resp2), (snd resp2))
	   | _  ->((List.append locList (fst resp2)), (snd resp2))) in
  match movelist with
    [] -> (fun (x:float) (y:float) (dir:float)-> ([(x,y)],dir))
  | Home::tl -> 
      let func = (fun (x:float) (y:float) (dir:float)->([(0.0,0.0)],dir)) in
      compose func (interpTrans tl)
  | Turn(newDir)::tl ->
      let func = (fun (x:float) (y:float) (dir:float)->([x, y], dir+newDir)) in
      compose func (interpTrans tl)
  | For(moves, lst)::tl -> 
      let subMoveList = loopFor moves lst 0 [] in
      let rec createFuncComp index = 
	if (index = ((List.length subMoveList)-1)) then
	  interpTrans tl
	else
	  compose (interpTrans ([List.nth subMoveList index])) (createFuncComp (index+1)) in
      createFuncComp 0
  | Forward(len)::tl ->
      let func = (fun (x:float) (y:float) (dir:float)->
	let xLen = (len *. (cos dir)) in
	let yLen = (len *. (sin dir)) in
	([(x+.xLen, y+.yLen)], dir)) in
         compose func (interpTrans tl)
	    
  (* ########################### *)

(*** possibly helpful testing code ***)

(* ######################################################################## *)
(* ############################################# *)

let example_logo_prog = 
  let arg1 = Sys.argv.(1) in
  let arg2 = Sys.argv.(2) in
[makePoly (int_of_string arg1) (float_of_string arg2)]

let ansL = interpLarge (example_logo_prog)
let ansS = interpSmall (example_logo_prog)
let ansI = (0.0,0.0)::(fst ((interpTrans example_logo_prog) 0.0 0.0 0.0))

let rec pr lst =
  match lst with
    [] -> ()
  | (x,y)::tl -> 
      print_string("(" ^ (string_of_float x) ^ "," ^ (string_of_float y) ^ ")");
      pr tl

let _=  pr ansL; print_newline (); 
 pr ansS; print_newline ();
 pr ansI; print_newline (); 

