
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
  if index = -1 then
      []
  else
    (f (String.get str index))::(map_helper f str (index-1))
    
let map f str =
   map_helper f str (String.length-1)

let fold_left f init str =
  raise Unimplemented

let fold_right f str init =
  raise Unimplemented



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
  | hd::tl -> (String.create hd)::(printRec tl)
let _ =
  let arg1 = Sys.argv.(1) in
  let ret = reverse arg1 in
  let _ = print_endline ret in
  let lst = map charConvert arg1 in
  print_endline (printRec lst)
