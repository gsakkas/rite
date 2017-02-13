
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
  fold_left_helper test_fold_left init str 0 

let  test_fold_right  b acc = "g(" ^ (char2str b) ^ ", " ^ acc ^ ")"

let rec fold_right_helper f str acc index = 
    if index = -1 then
      acc
    else
      fold_right_helper f str (f acc (String.get str index)) (index-1)

let fold_right f str init =
  fold_right_helper f str init (String.length str)

let uppercase s =
  raise Unimplemented

let lowercase s =
  raise Unimplemented

let titlecase s =
  raise Unimplemented
    
let histogram s =
  raise Unimplemented

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
  let foldLeftString = fold_left test_fold_left "null" "abcdefgh" in
  let _ = print_endline foldLeftString in 
  let foldRightString = fold_right test_fold_right "abcdefgh" "null" in
  print_endline foldRightString  


