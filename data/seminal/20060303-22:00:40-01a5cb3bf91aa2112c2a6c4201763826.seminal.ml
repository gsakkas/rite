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


let map f str =
  let l = String.length str in
  fun x -> 2+3


let _ = print_string(reverse "redskins")
let _ = print_string(map reverse "test");