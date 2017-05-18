
let rec wwhile (f,b) =
  match b with | b -> if (f b) = ((f b), true) then wwhile (f, b);;
