
let rec wwhile (f,b) = match f b with | (_,t) -> if t = true then 5;;
