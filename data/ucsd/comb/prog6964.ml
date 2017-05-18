
let rec wwhile (f,b) =
  let x y = (f, b) in if b = true then wwhile (f, x) else x;;
