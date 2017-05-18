
let rec wwhile (f,b) =
  let x = f b in match x with | h::t -> if t then wwhile (f, h) else h;;
