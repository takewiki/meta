\name{meta-package}

\alias{meta-package}

\alias{meta}

\docType{package}

\title{meta: Brief overview of methods and general hints}

\description{
R package \bold{meta} is a user-friendly general package providing
standard methods for meta-analysis and supporting Schwarzer et
al. (2015), \url{http://meta-analysis-with-r.org/}.
}

\details{
  R package \bold{meta} (Schwarzer, 2007) provides the following
  statistical methods for meta-analysis.
  \enumerate{
  \item Fixed effect and random effects model:
    \itemize{
    \item Meta-analysis of continuous outcome data (\code{\link{metacont}})
    \item Meta-analysis of binary outcome data (\code{\link{metabin}})
    \item Meta-analysis of incidence rates (\code{\link{metainc}})
    \item Generic inverse variance meta-analysis (\code{\link{metagen}})
    \item Meta-analysis of single correlations (\code{\link{metacor}})
    \item Meta-analysis of single means (\code{\link{metamean}})
    \item Meta-analysis of single proportions (\code{\link{metaprop}})
    \item Meta-analysis of single incidence rates (\code{\link{metarate}})
  }
  \item Several plots for meta-analysis:
    \itemize{
    \item Forest plot (\code{\link{forest}})
    \item Funnel plot (\code{\link{funnel}})
    \item Galbraith plot / radial plot (\code{\link{radial}})
    \item L'Abbe plot for meta-analysis with binary outcome data (\code{\link{labbe}})
    \item Baujat plot to explore heterogeneity in meta-analysis (\code{\link{baujat}})
    \item Bubble plot to display the result of a meta-regression (\code{\link{bubble}})
  }
  \item Statistical tests for funnel plot asymmetry
    (\code{\link{metabias}}) and trim-and-fill method
    (\code{\link{trimfill}}) to evaluate bias in meta-analysis
  \item Import data from 'RevMan 5' (\code{\link{read.rm5}}); see also
    \code{\link{metacr}} to conduct meta-analysis for a single
    comparison and outcome from a Cochrane review
  \item Prediction interval, Hartung-Knapp and Paule-Mandel method for
    random effects model (see arguments \code{prediction},
    \code{hakn}, and \code{method.tau}, respectively, in meta-analysis
    functions listed under \emph{1. Fixed effect and random effects model})
  \item Cumulative meta-analysis (\code{\link{metacum}}) and
    leave-one-out meta-analysis (\code{\link{metainf}})
  \item Meta-regression (\code{\link{metareg}}); if R package
    \bold{metafor} is installed
  \item Generalised linear mixed models (\code{\link{metabin}},
    \code{\link{metainc}}, \code{\link{metaprop}}, and
    \code{\link{metarate}}); if R packages \bold{metafor}, \bold{lme4},
    \bold{numDeriv}, and \bold{BiasedUrn} are installed
  }
  
  The following more advanced statistical methods are provided by
  add-on R packages:
  \itemize{
  \item Frequentist methods for network meta-analysis (R package
    \bold{netmeta})
  \item Advanced methods to model and adjust for bias in meta-analysis
    (R package \bold{metasens})
  }

  Results of several meta-analyses can be combined with
  \code{\link{metabind}}. This is, for example, useful to generate a
  forest plot with results of subgroup analyses.
  
  See \code{\link{settings.meta}} to learn how to print and specify
  default meta-analysis methods used during your R session. For
  example, the function can be used to specify general settings:
  \itemize{
   \item \code{settings.meta("revman5")}
   \item \code{settings.meta("jama")}
  }
  The first command can be used to reproduce meta-analyses from
  Cochrane reviews conducted with \emph{Review Manager 5} (RevMan 5,
  \url{http://community.cochrane.org/tools/review-production-tools/revman-5})
  and specifies to use a RevMan 5 layout in forest plots. The second
  command can be used to generate forest plots following instructions
  for authors of the \emph{Journal of the American Medical
  Association}
  (\url{http://jamanetwork.com/journals/jama/pages/instructions-for-authors}).

  In addition, \code{\link{settings.meta}} can be used to change
  individual settings. For example, the following R command specifies
  the use of the Hartung-Knapp and Paule-Mandel methods, and the
  printing of prediction intervals in the current R session for any
  meta-analysis generated after execution of this command:
  \itemize{
  \item \code{settings.meta(hakn=TRUE, method.tau="PM", prediction=TRUE)}
  }

  Type \code{help(package = "meta")} for a listing of R functions and
  datasets available in \bold{meta}.

  Schwarzer (2007) is the preferred citation in publications for
  \bold{meta}. Type \code{citation("meta")} for a BibTeX entry of this
  publication.

  To report problems and bugs
  \itemize{
  \item type \code{bug.report(package = "meta")} if you do not use
    RStudio,
  \item send an email to Guido Schwarzer
    \email{sc@imbi.uni-freiburg.de} if you use RStudio.
  }

  The development version of \bold{meta} is available on GitHub
  \url{https://github.com/guido-s/meta}.
}

\references{
  Schwarzer G (2007),
  meta: An R package for meta-analysis.
  \emph{R News}, \bold{7}(3), 40--5.
  \url{https://cran.r-project.org/doc/Rnews/Rnews_2007-3.pdf}

  Schwarzer G, Carpenter JR and Rücker G (2015),
  \emph{Meta-Analysis with R (Use-R!)}.
  Springer International Publishing, Switzerland.
  \url{http://www.springer.com/gp/book/9783319214153}
}

\author{Guido Schwarzer \email{sc@imbi.uni-freiburg.de}}
