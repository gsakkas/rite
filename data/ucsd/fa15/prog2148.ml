
let rec wwhile (f,b) =
  let (x,y) = match f with | (a,b)|_ -> (a, b) in
  if y = true then wwhile (f, y) else x;;
