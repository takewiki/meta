\name{update.meta}

\alias{update.meta}

\title{Update a meta-analysis object}

\description{
  Update an existing meta-analysis object created with R function metabin, metacont, metagen, metacor, or metaprop.
}

\usage{
\method{update}{meta}(object, 
       data=object$data, subset=object$subset,
       studlab=object$data$.studlab,
       method=object$method, sm=object$sm,
       incr=object$incr, allincr=object$allincr,
       addincr=object$addincr, allstudies=object$allstudies,
       MH.exact=object$MH.exact, RR.cochrane=object$RR.cochrane,
       level=object$level, level.comb=object$level.comb,
       comb.fixed=object$comb.fixed, comb.random=object$comb.random,
       hakn=object$hakn, method.tau=object$method.tau,
       tau.preset=object$tau.preset,
       TE.tau=object$TE.tau, tau.common=object$tau.common,
       prediction=object$prediction, level.predict=object$level.predict,
       method.bias=object$method.bias,
       title=object$title, complab=object$complab, outclab=object$outclab,
       label.e=object$label.e, label.c=object$label.c,
       label.left=object$label.left, label.right=object$label.right,
       n.e=object$n.e, n.c=object$n.c,
       byvar=object$byvar, bylab=object$bylab, print.byvar=object$print.byvar,
       print.CMH=object$print.CMH, keepdata=TRUE,
       warn=object$warn, ...)
}

\arguments{
  \item{object}{An object of class \code{meta}.}
  \item{data}{Dataset.}
  \item{subset}{Subset.}
  \item{studlab}{Study label.}
  \item{method}{A character string indicating which method is to be used
    for pooling of studies. One of \code{"Inverse"}, \code{"MH"}, or
    \code{"Peto"}, can be abbreviated. (only for metabin object)}
  \item{sm}{A character string indicating which summary measure is used for pooling.}
  \item{incr}{Could be either a numerical value which is added to each cell
  frequency for studies with a zero cell count or the character string
  \code{"TA"} which stands for treatment arm continuity correction.}
  \item{allincr}{A logical indicating if \code{incr} is added to each
    cell frequency of all studies if at least one study has a zero cell
    count. If FALSE (default), \code{incr} is added only to each cell frequency of
    studies with a zero cell count.}
  \item{addincr}{A logical indicating if \code{incr} is added to each cell
    frequency of all studies irrespective of zero cell counts.}
  \item{allstudies}{A logical indicating if studies with zero or all
    events in both groups are to be included in the meta-analysis
    (applies only if \code{sm} is equal to \code{"RR"} or \code{"OR"}).}
  \item{MH.exact}{A logical indicating if \code{incr} is not to be added
    to all cell frequencies for studies with a zero cell count to
    calculate the pooled estimate based on the Mantel-Haenszel method.}
  \item{RR.cochrane}{A logical indicating if 2*\code{incr} instead of
    1*\code{incr} is to be added to \code{n.e} and \code{n.c} in the
    calculation of the risk ratio (i.e., \code{sm="RR"}) for studies
    with a zero cell. This is used in RevMan 5, the
    Cochrane Collaboration's program for preparing and maintaining
    Cochrane reviews.}
  \item{level}{The level used to calculate confidence intervals for
    individual studies.}
  \item{level.comb}{The level used to calculate confidence intervals for
    pooled estimates.}
  \item{comb.fixed}{A logical indicating whether a fixed effect
    meta-analysis should be conducted.}
  \item{comb.random}{A logical indicating whether a random effects
    meta-analysis should be conducted.}
  \item{hakn}{A logical indicating whether the method by Hartung and
          Knapp should be used to adjust test statistics and
          confidence intervals.}
  \item{method.tau}{A character string indicating which method is used
    to estimate the between-study variance \eqn{\tau^2}. Either
    \code{"DL"}, \code{"PM"}, \code{"REML"}, \code{"ML"}, \code{"HS"},
    \code{"SJ"}, \code{"HE"}, or \code{"EB"}, can be abbreviated.}
  \item{tau.preset}{Prespecified value for between-study variance \eqn{\tau^2}.}
  \item{TE.tau}{Overall treatment effect used to estimate the
  between-study variance \eqn{\tau^2}.}
  \item{tau.common}{A logical indicating whether tau-squared should be
    the same across subgroups.}
  \item{prediction}{A logical indicating whether a prediction interval
    should be printed.}
  \item{level.predict}{The level used to calculate prediction interval
    for a new study.}
  \item{method.bias}{A character string indicating which test for
    funnel plot asymmetry is to be used. Either \code{"rank"},
    \code{"linreg"}, \code{"mm"}, \code{"count"}, \code{"score"}, or
    \code{"peters"}, can be abbreviated.}
  \item{title}{Title of meta-analysis / systematic review.}
  \item{complab}{Comparison label.}
  \item{outclab}{Outcome label.}
  \item{label.e}{Label for experimental group.}
  \item{label.c}{Label for control group.}
  \item{label.left}{Graph label on left side of forest plot.}
  \item{label.right}{Graph label on right side of forest plot.}
  \item{n.e}{Number of observations in experimental group. (only for metagen object)}
  \item{n.c}{Number of observations in control group. (only for metagen object)}
   \item{byvar}{An optional vector containing grouping information (must
    be of same length as \code{event.e}).}
  \item{bylab}{A character string with a label for the grouping variable.}
  \item{print.byvar}{A logical indicating whether the name of the grouping
    variable should be printed in front of the group labels.}
  \item{print.CMH}{A logical indicating whether result of the
    Cochran-Mantel-Haenszel test for overall effect should be printed.}
  \item{keepdata}{A logical indicating whether original data (set)
    should be kept in meta object.}
  \item{warn}{A logical indicating whether warnings should be printed
    (e.g., if \code{incr} is added to studies with zero cell
    frequencies).}
  \item{\dots}{Additional arguments (ignored at the moment).}
}

\details{
  Wrapper function to update an existing meta-analysis object which
  was created with R function metabin, metacont, metagen, metacor, or
  metaprop.
  
  More details on function arguments are available in help files of R
  function metabin, metacont, metagen, metacor, or metaprop,
  respectively.
}

\value{
  An object of class \code{"meta"} and \code{"metabin"},
  \code{"metacont"}, \code{"metagen"}, \code{"metaprop"}, or
  \code{"metacor"}.
}

\author{Guido Schwarzer \email{sc@imbi.uni-freiburg.de}}

\seealso{\code{\link{metabin}}, \code{\link{metacont}}, \code{\link{metagen}}, \code{\link{metaprop}}, \code{\link{metacor}}}

\examples{
data(Fleiss93cont)
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
                  data=Fleiss93cont, sm="SMD", studlab=study)
meta1

# Change summary measure (from 'SMD' to 'MD')
#
update(meta1, sm="MD")

# Restrict analysis to subset of studies
#
update(meta1, subset=1:2)

# Use different levels for confidence intervals
#
meta2 <- update(meta1, level=0.66, level.comb=0.99)
print(meta2, digits=2)
forest(meta2)
}

\keyword{htest}