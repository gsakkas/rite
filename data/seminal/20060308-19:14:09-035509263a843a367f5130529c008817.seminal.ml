
exception Unimplemented

let char2str c = String.make 1 c

let rec getStr str count = 
  if count = -1 then
    ""
  else
    (char2str (String.get str count)) ^ (getStr str (count-1))

let reverse str = 
  let count = (String.length str)-1 in
  getStr str count
  
let rec map_helper f str index =
  if index = String.length str then
      []
  else
    (f (String.get str index))::(map_helper f str (index+1))
    
let map f str =
   map_helper f str 0
    
let test_fold_left acc b = "f(" ^ acc ^ ", " ^ (char2str b) ^ ")"

let rec fold_left_helper f acc str index = 
    if index = (String.length str) then
      acc
    else
      fold_left_helper f (f acc (String.get str index)) str (index+1)
	
let fold_left f init str =
  fold_left_helper f init str 0 

let  test_fold_right  b acc = "g(" ^ (char2str b) ^ ", " ^ acc ^ ")"

let rec fold_right_helper f str acc index = 
    if index = -1 then
      acc
    else
      fold_right_helper f str (f (String.get str index) acc) (index-1)

let fold_right f str init =
  fold_right_helper f str init ((String.length str)-1)

let rec char_list_to_string charList =
    match charList with
      [] -> ""
    | hd::tl -> (char2str hd) ^ (char_list_to_string tl)

let uppercase s =
  let lst = map (fun c -> (Char.uppercase c)) s in
  char_list_to_string lst
      

let lowercase s =
  let lst = map (fun c -> (Char.lowercase c)) s in
  char_list_to_string lst

type caseTester =
    Tester of bool * string

let test_title acc a = 
  if (Char.compare a ' ') = 0 then
    match acc with
      Tester (is_space, str)->Tester( true, str^(char2str a))
  else
    match acc with
      Tester(is_space, str) ->
    if (is_space) then
      Tester( false, str^ (uppercase (char2str a)))
    else
      Tester(false, str^(lowercase (char2str a)))

let titlecase s =
  let arg = Tester(true, "") in
  fold_left test_title arg s
  
type charCounter =
    Counter of int * char

let histogram_fold acc a =
    match acc with
      Counter(i, c) ->
	if (Char.compare a c) then
	  Counter(i+1,c)
	else
	  Counter(i, c)

let histogram s =
  fold_left histogram_fold Counter(0,'t') s

let charConvert char = Char.code char

let rec printRec lst = 
match lst with
 [] -> "" 
 | hd::tl -> string_of_int hd ^ " " ^ (printRec tl) 

let _ = let arg1 = Sys.argv.(1) in 
  let ret = reverse arg1 in 
  let _ = print_endline ret in
  let lst = map charConvert arg1 in 
  let _=print_endline (printRec lst) in
  let foldLeftString = fold_left test_fold_left "null" arg1 in
  let _ = print_endline foldLeftString in 
  let foldRightString = fold_right test_fold_right arg1 "null" in
  let _ = print_endline foldRightString  in
  let _ = print_endline (uppercase arg1) in
  let _ =  print_endline (lowercase arg1) in
  let test = titlecase arg1 in
  let _ = match test with
            Tester(b, s) -> print_endline s in
  histogram arg1


