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
  reverseHelp place str



let rec mapHelp f place str =
  let revStr = Char.escaped str.[place] in
  let currPlace = place - 1 in
  if place > 0 then 
    (f str.[place])::(mapHelp f currPlace str)
  else
    []

let map f str =
  let strLen = String.length str in
  let place = strLen - 1 in
    match str with
        ""	-> []
      | st	-> mapHelp f place st


let upperMatch ch =
  match ch with
      'a' .. 'z'	-> char_of_int(int_of_char(ch)-32)
    | ret 		-> ret

let uppercase s =
  map upperMatch s

let _ = print_string(reverse "redskins")
let _ = print_string(uppercase "time")


