let rec reverseHelp place str =
  let revStr = Char.escaped str.[place] in
  let currPlace = place - 1 in
  if place > 0 then
    revStr ^ reverseHelp currPlace str
  else
    revStr 
  

let reverse str =
  let strLen = String.length str in
  let place = strLen - 1 in
  let currChar = str.[0] in 
  reverseHelp place str


let rec map f str =
  match str with
      [] 	-> []
    | hd::tl	-> (f hd)::(map f tl)
  
let _ = print_string(reverse "redskins")
let _ = print_string(map "test");