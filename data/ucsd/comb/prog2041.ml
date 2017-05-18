
let (x,y) = ("5", 5);;

let rec wwhile (f,b) =
  let f b = (x, y) in if x = true then wwhile (f, x) else x;;
