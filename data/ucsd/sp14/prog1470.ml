
let rec wwhile (f,b) =
  match b with
  | (express,boo) -> if boo = true then wwhile (f, express) else express;;
