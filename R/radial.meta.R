radial.meta <- function(x,
                        xlim = NULL, ylim = NULL,
                        xlab = "Inverse of standard error",
                        ylab = "Standardised treatment effect (z-score)",
                        comb.fixed = TRUE, axes = TRUE,
                        pch = 1, text = NULL, cex = 1, col = NULL,
                        level = NULL, ...) {
  
  
  ##
  ##
  ## (1) Check for meta object
  ##
  ##
  chkclass(x, "meta")
  
  
  TE <- x$TE
  seTE <- x$seTE
  
  
  if(length(TE) != length(seTE))
    stop("length of argument TE and seTE must be equal")

  if (!is.null(level) && (level <=0 | level >= 1))
    stop("no valid level for confidence interval")
  
  
  ##
  ## Exclude studies from funnel plot
  ## 
  if (!is.null(x$exclude)) {
    TE <- TE[!x$exclude]
    seTE <- seTE[!x$exclude]
    if (!is.null(text))
      text <- text[!x$exclude]
  }
  
  
  zscore <- TE / seTE

  if (is.null(xlim)) xlim <- c(0, max(1 / seTE, na.rm = TRUE))
  if (is.null(ylim)) ylim <- c(min(c(-2, zscore), na.rm = TRUE),
                               max(c( 2, zscore), na.rm = TRUE))

  plot(1 / seTE, zscore,
       xlab = xlab, ylab = ylab, xlim = xlim, ylim = ylim,
       axes = axes, type = "n", ...)

  if (is.null(text)) {
    if (is.null(col))
      points(1 / seTE, zscore, pch = pch, cex = cex)
    else
      points(1 / seTE, zscore, pch = pch, cex = cex, col = col)
  }
  else {
    if (is.null(col))
      text(1 / seTE, zscore, labels = text, cex = cex)
    else
      text(1 / seTE, zscore, labels = text, cex = cex, col = col)
  }

  if (comb.fixed) {
    lmcomb <- lm(zscore ~ I(1 / seTE) - 1)
    abline(lmcomb, lty = 4)
    if (!is.null(level)) {
      alpha <- 1 - level
      abline(qnorm(1 - alpha / 2), coef(lmcomb), lty = 2)
      abline(qnorm(    alpha / 2), coef(lmcomb), lty = 2)
    }
  }
  
  invisible(NULL)
}
