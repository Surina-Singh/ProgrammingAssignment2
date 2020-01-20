## Put comments here that give an overall description of what your
## functions do
### The `makeCacheMatrix` function creates a special "matrix" object that can cache its inverse. Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly.
### Whereas, the `cacheSolve` function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. If the inverse has already been calculated (and the matrix has not changed), then `cacheSolve` should retrieve the inverse from the cache. Computing the inverse of a square matrix can be done with the `solve` function in R. For example, if `X` is a square invertible matrix, then `solve(X)` returns its inverse. The  function, makeVector creates a special “vector”, which is really a list containing a function to:


## Write a short comment describing this function
### The `makeCacheMatrix` function creates a special "matrix" object that can cache its inverse
### "i" stands for inverse, "x" stn

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
    }
  get <- function() x
  setInverse <- function(solveMatrix) i <<- solveMatrix
  getInverse <- function() i
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}

## Write a short comment describing this function
### The `cacheSolve` function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i      
}
