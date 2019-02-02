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


let map f s =
  let l = String.length s in
  if l = 0 then s else begin
  end


let _ = print_string(reverse "redskins")