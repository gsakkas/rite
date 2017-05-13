
let rec ffor (low,high,f) = if low > high then () else (let _ = f low in f);;
