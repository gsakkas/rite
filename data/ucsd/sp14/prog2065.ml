
let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let rec wwwhile (f,b) =
  match f with | (x,y) -> if y = true then wwhile (f, x) else x;;
