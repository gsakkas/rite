
let rec wwhile (f,b) =
  let (x,y) = b f in if y = true then wwhile (f, x) else x;;
