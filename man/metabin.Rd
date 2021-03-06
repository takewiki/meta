\name{metabin}

\alias{metabin}

\title{Meta-analysis of binary outcome data}

\description{
  Calculation of fixed effect and random effects estimates (risk
  ratio, odds ratio, risk difference, or arcsine difference) for
  meta-analyses with binary outcome data. Mantel-Haenszel, inverse
  variance, Peto method, and generalised linear mixed model (GLMM) are
  available for pooling. For GLMMs, the
  \code{\link[metafor]{rma.glmm}} function from R package
  \bold{metafor} (Viechtbauer 2010) is called internally.
}

\usage{
metabin(event.e, n.e, event.c, n.c, studlab,
        data=NULL, subset=NULL, exclude=NULL,
        method=ifelse(tau.common, "Inverse", gs("method")),
        sm=
        ifelse(!is.na(charmatch(tolower(method), c("peto", "glmm"),
                                nomatch = NA)),
                      "OR", gs("smbin")),
        incr=gs("incr"), allincr=gs("allincr"),
        addincr=gs("addincr"), allstudies=gs("allstudies"),
        MH.exact=gs("MH.exact"), RR.cochrane=gs("RR.cochrane"),
        model.glmm = "UM.FS",
        level=gs("level"), level.comb=gs("level.comb"),
        comb.fixed=gs("comb.fixed"), comb.random=gs("comb.random"),
        hakn=gs("hakn"),
        method.tau=
        ifelse(!is.na(charmatch(tolower(method), "glmm", nomatch = NA)),
               "ML", gs("method.tau")),
        tau.preset=NULL, TE.tau=NULL,
        tau.common=gs("tau.common"),
        prediction=gs("prediction"), level.predict=gs("level.predict"),
        method.bias=ifelse(sm=="OR", "score", gs("method.bias")),
        backtransf=gs("backtransf"), pscale = 1,
        title=gs("title"), complab=gs("complab"), outclab="",
        label.e=gs("label.e"), label.c=gs("label.c"),
        label.left=gs("label.left"), label.right=gs("label.right"),
        byvar, bylab, print.byvar=gs("print.byvar"),
        byseparator = gs("byseparator"),
        print.CMH=gs("print.CMH"),
        keepdata=gs("keepdata"),
        warn=gs("warn"),
        ...)
}

\arguments{
  \item{event.e}{Number of events in experimental group.}
  \item{n.e}{Number of observations in experimental group.}
  \item{event.c}{Number of events in control group.}
  \item{n.c}{Number of observations in control group.}
  \item{studlab}{An optional vector with study labels.}
  \item{data}{An optional data frame containing the study information,
    i.e., event.e, n.e, event.c, and n.c.}
  \item{subset}{An optional vector specifying a subset of studies to
    be used.}
  \item{exclude}{An optional vector specifying studies to exclude from
    meta-analysis, however, to include in printouts and forest plots.}
  \item{method}{A character string indicating which method is to be
    used for pooling of studies. One of \code{"Inverse"}, \code{"MH"},
    \code{"Peto"}, or \code{"GLMM"}, can be abbreviated.}
  \item{sm}{A character string indicating which summary measure
    (\code{"RR"}, \code{"OR"}, \code{"RD"}, or \code{"ASD"}) is to be used
    for pooling of studies, see Details.}
  \item{incr}{Could be either a numerical value which is added to each
    cell frequency for studies with a zero cell count or the character
    string \code{"TACC"} which stands for treatment arm continuity
    correction, see Details.}
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
  \item{model.glmm}{A character string indicating which GLMM should be
    used. One of \code{"UM.FS"}, \code{"UM.RS"}, \code{"CM.EL"}, and
    \code{"CM.AL"}, see Details.}
  \item{level}{The level used to calculate confidence intervals for
    individual studies.}
  \item{level.comb}{The level used to calculate confidence intervals for
    pooled estimates.}
  \item{comb.fixed}{A logical indicating whether a fixed effect
    meta-analysis should be conducted.}
  \item{comb.random}{A logical indicating whether a random effects
    meta-analysis should be conducted.}
  \item{prediction}{A logical indicating whether a prediction interval
    should be printed.}
  \item{level.predict}{The level used to calculate prediction interval
    for a new study.}
  \item{hakn}{A logical indicating whether the method by Hartung and
          Knapp should be used to adjust test statistics and
          confidence intervals.}
  \item{method.tau}{A character string indicating which method is used
    to estimate the between-study variance \eqn{\tau^2}. Either
    \code{"DL"}, \code{"PM"}, \code{"REML"}, \code{"ML"}, \code{"HS"},
    \code{"SJ"}, \code{"HE"}, or \code{"EB"}, can be abbreviated.}
  \item{tau.preset}{Prespecified value for the square-root of the
    between-study variance \eqn{\tau^2}.}
  \item{TE.tau}{Overall treatment effect used to estimate the
  between-study variance \eqn{\tau^2}.}
  \item{tau.common}{A logical indicating whether tau-squared should be
    the same across subgroups.}
  \item{method.bias}{A character string indicating which test for
    funnel plot asymmetry is to be used. Either \code{"rank"},
    \code{"linreg"}, \code{"mm"}, \code{"count"}, \code{"score"}, or
    \code{"peters"}, can be abbreviated. See function \code{\link{metabias}}}
  \item{backtransf}{A logical indicating whether results for odds
    ratio (\code{sm="OR"}) and risk ratio (\code{sm="RR"}) should be
    back transformed in printouts and plots. If TRUE (default),
    results will be presented as odds ratios and risk ratios;
    otherwise log odds ratios and log risk ratios will be shown.}
  \item{pscale}{A numeric defining a scaling factor for printing of
    risk differences.}
  \item{title}{Title of meta-analysis / systematic review.}
  \item{complab}{Comparison label.}
  \item{outclab}{Outcome label.}
  \item{label.e}{Label for experimental group.}
  \item{label.c}{Label for control group.}
  \item{label.left}{Graph label on left side of forest plot.}
  \item{label.right}{Graph label on right side of forest plot.}
  \item{byvar}{An optional vector containing grouping information (must
    be of same length as \code{event.e}).}
  \item{bylab}{A character string with a label for the grouping variable.}
  \item{print.byvar}{A logical indicating whether the name of the grouping
    variable should be printed in front of the group labels.}
  \item{byseparator}{A character string defining the separator between
    label and levels of grouping variable.}
  \item{print.CMH}{A logical indicating whether result of the
    Cochran-Mantel-Haenszel test for overall effect should be printed.}
  \item{keepdata}{A logical indicating whether original data (set)
    should be kept in meta object.}
  \item{warn}{A logical indicating whether warnings should be printed
    (e.g., if \code{incr} is added to studies with zero cell
    frequencies).}
  \item{\dots}{Additional arguments passed on to
    \code{\link[metafor]{rma.glmm}} function.}
}

\details{
  Treatment estimates and standard errors are calculated for each
  study. The following measures of treatment effect are available:
  \itemize{
   \item Risk ratio (\code{sm="RR"})
   \item Odds ratio (\code{sm="OR"})
   \item Risk difference (\code{sm="RD"})
   \item Arcsine difference (\code{sm="ASD"})
  }
  
  For several arguments defaults settings are utilised (assignments
  using \code{\link{gs}} function). These defaults can be changed
  using the \code{\link{settings.meta}} function.
  
  Internally, both fixed effect and random effects models are
  calculated regardless of values chosen for arguments
  \code{comb.fixed} and \code{comb.random}. Accordingly, the estimate
  for the random effects model can be extracted from component
  \code{TE.random} of an object of class \code{"meta"} even if
  argument \code{comb.random=FALSE}. However, all functions in R
  package \bold{meta} will adequately consider the values for
  \code{comb.fixed} and \code{comb.random}. E.g. function
  \code{\link{print.meta}} will not print results for the random
  effects model if \code{comb.random=FALSE}.

  By default, both fixed effect and random effects models are
  considered (see arguments \code{comb.fixed} and
  \code{comb.random}). If \code{method} is \code{"MH"} (default), the
  Mantel-Haenszel method is used to calculate the fixed effect
  estimate; if \code{method} is \code{"Inverse"}, inverse variance
  weighting is used for pooling; if \code{method} is \code{"Peto"},
  the Peto method is used for pooling. For the Peto method, Peto's log
  odds ratio, i.e. \code{(O - E) / V} and its standard error
  \code{sqrt(1 / V)} with \code{O - E} and \code{V} denoting "Observed
  minus Expected" and "V", are utilised in the random effects
  model. Accordingly, results of a random effects model using
  \code{sm="Peto"} can be (slightly) different to results from a
  random effects model using \code{sm="MH"} or \code{sm="Inverse"}.
  
  A distinctive and frequently overlooked advantage of binary
  endpoints is that individual patient data (IPD) can be extracted
  from a two-by-two table. Accordingly, statistical methods for IPD,
  i.e., logistic regression and generalised linear mixed models, can
  be utilised in a meta-analysis of binary outcomes (Stijnen et al.,
  2010; Simmonds et al., 2014). These methods are available (argument
  \code{method = "GLMM"}) for the odds ratio as summary measure by
  calling the \code{\link[metafor]{rma.glmm}} function from R package
  \bold{metafor} internally. Four different GLMMs are available for
  meta-analysis with binary outcomes using argument \code{model.glmm}
  (which corresponds to argument \code{model} in the
  \code{\link[metafor]{rma.glmm}} function): 
  \itemize{
    \item Logistic regression model with fixed study effects (default)
    \item[] (\code{model.glmm = "UM.FS"}, i.e., \bold{U}nconditional
      \bold{M}odel - \bold{F}ixed \bold{S}tudy effects)
    \item Mixed-effects logistic regression model with random study
      effects
    \item[] (\code{model.glmm = "UM.RS"}, i.e., \bold{U}nconditional
      \bold{M}odel - \bold{R}andom \bold{S}tudy effects)
    \item Generalised linear mixed model (conditional Hypergeometric-Normal)
    \item[] (\code{model.glmm = "CM.EL"}, i.e., \bold{C}onditional
      \bold{M}odel - \bold{E}xact \bold{L}ikelihood)
    \item Generalised linear mixed model (conditional Binomial-Normal)
    \item[] (\code{model.glmm = "CM.AL"}, i.e., \bold{C}onditional
      \bold{M}odel - \bold{A}pproximate \bold{L}ikelihood)
  }
  Details on these four GLMMs as well as additional arguments which
  can be provided using argument '\code{\dots}' in \code{metabin} are
  described in \code{\link[metafor]{rma.glmm}} where you can also find
  information on the iterative algorithms used for estimation.  Note,
  regardless of which value is used for argument \code{model.glmm},
  results for two different GLMMs are calculated: fixed effect model
  (with fixed treatment effect) and random effects model (with random
  treatment effects).
    
  For studies with a zero cell count, by default, 0.5 is added to all
  cell frequencies of these studies; if \code{incr} is \code{"TACC"} a
  treatment arm continuity correction is used instead (Sweeting et
  al., 2004; Diamond et al., 2007). For odds ratio and risk ratio,
  treatment estimates and standard errors are only calculated for
  studies with zero or all events in both groups if \code{allstudies}
  is \code{TRUE}. This continuity correction is used both to calculate
  individual study results with confidence limits and to conduct
  meta-analysis based on the inverse variance method. For Peto method
  and GLMMs no continuity correction is used. For the Mantel-Haenszel
  method, by default (if \code{MH.exact} is FALSE), \code{incr} is
  added to all cell frequencies of a study with a zero cell count in
  the calculation of the pooled risk ratio or odds ratio as well as
  the estimation of the variance of the pooled risk difference, risk
  ratio or odds ratio. This approach is also used in other software,
  e.g. RevMan 5 and the Stata procedure metan. According to Fleiss (in
  Cooper & Hedges, 1994), there is no need to add 0.5 to a cell
  frequency of zero to calculate the Mantel-Haenszel estimate and he
  advocates the exact method (\code{MH.exact}=TRUE). Note, estimates
  based on exact Mantel-Haenszel method or GLMM are not defined if the
  number of events is zero in all studies either in the experimental
  or control group.

  Argument \code{byvar} can be used to conduct subgroup analysis for
  all methods but GLMMs. Instead use the \code{\link{metareg}}
  function for GLMMs which can also be used for continuous covariates.
  
  A prediction interval for treatment effect of a new study is
  calculated (Higgins et al., 2009) if arguments \code{prediction} and
  \code{comb.random} are \code{TRUE}.

  R function \code{\link{update.meta}} can be used to redo the
  meta-analysis of an existing metabin object by only specifying
  arguments which should be changed.

  For the random effects, the method by Hartung and Knapp (2001) is
  used to adjust test statistics and confidence intervals if argument
  \code{hakn=TRUE}. For GLMMs, a method similar to Knapp and Hartung
  (2003) is implemented, see description of argument \code{tdist} in
  \code{\link[metafor]{rma.glmm}}.

  The DerSimonian-Laird estimate (1986) is used in the random effects
  model if \code{method.tau="DL"}. The iterative Paule-Mandel method
  (1982) to estimate the between-study variance is used if argument
  \code{method.tau="PM"}. Internally, R function \code{paulemandel} is
  called which is based on R function mpaule.default from R package
  \bold{metRology} from S.L.R. Ellison <s.ellison at lgc.co.uk>.
  
  If R package \bold{metafor} (Viechtbauer 2010) is installed, the
  following methods to estimate the between-study variance
  \eqn{\tau^2} (argument \code{method.tau}) are also available:
  \itemize{
   \item Restricted maximum-likelihood estimator (\code{method.tau="REML"})
   \item Maximum-likelihood estimator (\code{method.tau="ML"})
   \item Hunter-Schmidt estimator (\code{method.tau="HS"})
   \item Sidik-Jonkman estimator (\code{method.tau="SJ"})
   \item Hedges estimator (\code{method.tau="HE"})
   \item Empirical Bayes estimator (\code{method.tau="EB"}).
  }
  For these methods the R function \code{rma.uni} of R package
  \bold{metafor} is called internally. See help page of R function
  \code{rma.uni} for more details on these methods to estimate
  between-study variance.
}

\value{
  An object of class \code{c("metabin", "meta")} with corresponding
  \code{print}, \code{summary}, and \code{forest} functions. The
  object is a list containing the following components:
  \item{event.e, n.e, event.c, n.c, studlab, exclude,}{}
  \item{sm, method, incr, allincr, addincr,}{}
  \item{allstudies, MH.exact, RR.cochrane, model.glmm, warn,}{}
  \item{level, level.comb, comb.fixed, comb.random,}{}
  \item{hakn, method.tau, tau.preset, TE.tau, method.bias,}{}
  \item{tau.common, title, complab, outclab,}{}
  \item{label.e, label.c, label.left, label.right,}{}
  \item{byvar, bylab, print.byvar, byseparator}{As defined above.}
  \item{TE, seTE}{Estimated treatment effect and standard error of individual studies.}
  \item{lower, upper}{Lower and upper confidence interval limits
    for individual studies.}
  \item{zval, pval}{z-value and p-value for test of treatment
    effect for individual studies.}
  \item{w.fixed, w.random}{Weight of individual studies (in fixed and
    random effects model).}
  \item{TE.fixed, seTE.fixed}{Estimated overall treatment effect,
    e.g., log risk ratio or risk difference, and standard error (fixed
    effect model).}
  \item{lower.fixed, upper.fixed}{Lower and upper confidence interval limits
  (fixed effect model).}
  \item{zval.fixed, pval.fixed}{z-value and p-value for test of
    overall treatment effect (fixed effect model).}
  \item{TE.random, seTE.random}{Estimated overall treatment effect,
    e.g., log risk ratio or risk difference, and standard error
    (random effects model).}
  \item{lower.random, upper.random}{Lower and upper confidence interval limits
    (random effects model).}
  \item{zval.random, pval.random}{z-value or t-value and corresponding
    p-value for test of overall treatment effect (random effects
    model).}
  \item{prediction, level.predict}{As defined above.}
  \item{seTE.predict}{Standard error utilised for prediction interval.}
  \item{lower.predict, upper.predict}{Lower and upper limits of prediction interval.}
  \item{k}{Number of studies combined in meta-analysis.}
  \item{Q}{Heterogeneity statistic Q.}
  \item{df.Q}{Degrees of freedom for heterogeneity statistic.}
  \item{pval.Q}{P-value of heterogeneity test.}
  \item{Q.LRT}{Heterogeneity statistic for likelihood-ratio test (only
    if \code{method = "GLMM"}).}
  \item{df.Q.LRT}{Degrees of freedom for likelihood-ratio test}
  \item{pval.Q.LRT}{P-value of likelihood-ratio test.}
  \item{tau}{Square-root of between-study variance.}
  \item{se.tau}{Standard error of square-root of between-study variance.}
  \item{C}{Scaling factor utilised internally to calculate common
    tau-squared across subgroups.}
  \item{Q.CMH}{Cochran-Mantel-Haenszel test statistic for overall effect.}
  \item{df.Q.CMH}{Degrees of freedom for Cochran-Mantel-Haenszel test
    statistic.}
  \item{pval.Q.CMH}{P-value of Cochran-Mantel-Haenszel test.}
  \item{incr.e, incr.c}{Increment added to cells in the experimental and
    control group, respectively.}
  \item{sparse}{Logical flag indicating if any study included in
    meta-analysis has any zero cell frequencies.}
  \item{doublezeros}{Logical flag indicating if any study has zero
    cell frequencies in both treatment groups.}
  \item{df.hakn}{Degrees of freedom for test of treatment effect for
    Hartung-Knapp method (only if \code{hakn=TRUE}).}
  \item{k.MH}{Number of studies combined in meta-analysis using
    Mantel-Haenszel method.}
  \item{bylevs}{Levels of grouping variable - if \code{byvar} is not
    missing.}
  \item{TE.fixed.w, seTE.fixed.w}{Estimated treatment effect and
    standard error in subgroups (fixed effect model) - if \code{byvar}
    is not missing.}
  \item{lower.fixed.w, upper.fixed.w}{Lower and upper confidence
    interval limits in subgroups (fixed effect model) - if
    \code{byvar} is not missing.}
  \item{zval.fixed.w, pval.fixed.w}{z-value and p-value for test of
    treatment effect in subgroups (fixed effect model) - if
    \code{byvar} is not missing.}
  \item{TE.random.w, seTE.random.w}{Estimated treatment effect and
    standard error in subgroups (random effects model) - if
    \code{byvar} is not missing.}
  \item{lower.random.w, upper.random.w}{Lower and upper confidence
    interval limits in subgroups (random effects model) - if
    \code{byvar} is not missing.}
  \item{zval.random.w, pval.random.w}{z-value or t-value and
    corresponding p-value for test of treatment effect in subgroups
    (random effects model) - if \code{byvar} is not missing.}
  \item{w.fixed.w, w.random.w}{Weight of subgroups (in fixed and
    random effects model) - if \code{byvar} is not missing.}
  \item{df.hakn.w}{Degrees of freedom for test of treatment effect for
    Hartung-Knapp method in subgroups - if \code{byvar} is not missing
    and \code{hakn=TRUE}.}
  \item{n.harmonic.mean.w}{Harmonic mean of number of observations in
    subgroups (for back transformation of Freeman-Tukey Double arcsine
    transformation) - if \code{byvar} is not missing.}
  \item{event.e.w}{Number of events in experimental group in subgroups
    - if \code{byvar} is not missing.}
  \item{n.e.w}{Number of observations in experimental group in
    subgroups - if \code{byvar} is not missing.}
  \item{event.c.w}{Number of events in control group in subgroups - if
    \code{byvar} is not missing.}
  \item{n.c.w}{Number of observations in control group in subgroups -
    if \code{byvar} is not missing.}
  \item{k.w}{Number of studies combined within subgroups - if
    \code{byvar} is not missing.}
  \item{k.all.w}{Number of all studies in subgroups - if \code{byvar}
    is not missing.}
  \item{Q.w.fixed}{Overall within subgroups heterogeneity statistic Q
    (based on fixed effect model) - if \code{byvar} is not missing.}    
  \item{Q.w.random}{Overall within subgroups heterogeneity statistic Q
    (based on random effects model) - if \code{byvar} is not missing
    (only calculated if argument \code{tau.common} is TRUE).}
  \item{df.Q.w}{Degrees of freedom for test of overall within
    subgroups heterogeneity - if \code{byvar} is not missing.}
  \item{pval.Q.w.fixed}{P-value of within subgroups heterogeneity
    statistic Q (based on fixed effect model) - if \code{byvar} is not
    missing.}
  \item{pval.Q.w.random}{P-value of within subgroups heterogeneity
    statistic Q (based on random effects model) - if \code{byvar} is
    not missing.}
  \item{Q.b.fixed}{Overall between subgroups heterogeneity statistic Q
    (based on fixed effect model) - if \code{byvar} is not missing.}
  \item{Q.b.random}{Overall between subgroups heterogeneity statistic
    Q (based on random effects model) - if \code{byvar} is not
    missing.}
  \item{df.Q.b}{Degrees of freedom for test of overall between
    subgroups heterogeneity - if \code{byvar} is not missing.}
  \item{pval.Q.b.fixed}{P-value of between subgroups heterogeneity
    statistic Q (based on fixed effect model) - if \code{byvar} is not
    missing.}
  \item{pval.Q.b.random}{P-value of between subgroups heterogeneity
    statistic Q (based on random effects model) - if \code{byvar} is
    not missing.}
  \item{tau.w}{Square-root of between-study variance within subgroups
    - if \code{byvar} is not missing.}
  \item{C.w}{Scaling factor utilised internally to calculate common
    tau-squared across subgroups - if \code{byvar} is not missing.}
  \item{H.w}{Heterogeneity statistic H within subgroups - if
    \code{byvar} is not missing.}
  \item{lower.H.w, upper.H.w}{Lower and upper confidence limti for
    heterogeneity statistic H within subgroups - if \code{byvar} is
    not missing.}
   \item{I2.w}{Heterogeneity statistic I2 within subgroups - if
    \code{byvar} is not missing.}
  \item{lower.I2.w, upper.I2.w}{Lower and upper confidence limti for
    heterogeneity statistic I2 within subgroups - if \code{byvar} is
    not missing.}
  \item{keepdata}{As defined above.}
  \item{data}{Original data (set) used in function call (if
    \code{keepdata=TRUE}).}
  \item{subset}{Information on subset of original data used in
    meta-analysis (if \code{keepdata=TRUE}).}
  \item{.glmm.fixed}{GLMM object generated by call of
    \code{\link[metafor]{rma.glmm}} function (fixed effect model).}
  \item{.glmm.random}{GLMM object generated by call of
    \code{\link[metafor]{rma.glmm}} function (random effects model).}
  \item{call}{Function call.}
  \item{version}{Version of R package \bold{meta} used to create object.}
  \item{version.metafor}{Version of R package \bold{metafor} used for GLMMs.}
}

\references{
  Cooper H & Hedges LV (1994),
  \emph{The Handbook of Research Synthesis}.
  Newbury Park, CA: Russell Sage Foundation.

  Diamond GA, Bax L, Kaul S (2007),
  Uncertain Effects of Rosiglitazone on the Risk for Myocardial
  Infarction and Cardiovascular Death.
  \emph{Annals of Internal Medicine}, \bold{147}, 578--581.

  DerSimonian R & Laird N (1986),
  Meta-analysis in clinical trials. \emph{Controlled Clinical Trials},
  \bold{7}, 177--188.

  Fleiss JL (1993),
  The statistical basis of meta-analysis.
  \emph{Statistical Methods in Medical Research}, \bold{2}, 121--145.

  Greenland S & Robins JM (1985),
  Estimation of a common effect parameter from sparse follow-up data.
  \emph{Biometrics}, \bold{41}, 55--68.

  Hartung J & Knapp G (2001),
  A Refined Method for the Meta-analysis of Controlled Clinical Trials
  with Binary Outcome.
  \emph{Statistics in Medicine}, \bold{20}, 3875--89.
  
  Higgins JPT, Thompson SG, Spiegelhalter DJ (2009),
  A re-evaluation of random-effects meta-analysis.
  \emph{Journal of the Royal Statistical Society: Series A},
  \bold{172}, 137--159.
  
  Knapp G & Hartung J (2003),
  Improved Tests for a Random Effects Meta-regression with a Single
  Covariate.
  \emph{Statistics in Medicine}, \bold{22}, 2693--710,
  doi: 10.1002/sim.1482 .
  
  \emph{Review Manager (RevMan)} [Computer program]. Version
  5.3. Copenhagen: The Nordic Cochrane Centre, The Cochrane
  Collaboration, 2014.
  
  Paule RC & Mandel J (1982),
  Consensus values and weighting factors.
  \emph{Journal of Research of the National Bureau of Standards},
  \bold{87}, 377--385.
  
  Pettigrew HM, Gart JJ, Thomas DG (1986),
  The bias and higher cumulants of the logarithm of a binomial
  variate. \emph{Biometrika}, \bold{73}, 425--435.

  Rücker G, Schwarzer G, Carpenter JR (2008),
  Arcsine test for publication bias in meta-analyses with binary
  outcomes. \emph{Statistics in Medicine}, \bold{27}, 746--763.
  
  Simmonds MC, Higgins JP (2014),
  A general framework for the use of logistic regression models in
  meta-analysis.
  \emph{Statistical Methods in Medical Research}.
    
  StataCorp. 2011.
  \emph{Stata Statistical Software: Release 12}. College Station, TX:
  StataCorp LP.
  
  Stijnen T, Hamza TH, Ozdemir P (2010),
  Random effects meta-analysis of event outcome in the framework of
  the generalized linear mixed model with applications in sparse
  data.
  \emph{Statistics in Medicine}, \bold{29}, 3046--67.
  
  Sweeting MJ, Sutton AJ, Lambert PC (2004),
  What to add to nothing? Use and avoidance of continuity corrections
  in meta-analysis of sparse data.
  \emph{Statistics in Medicine}, \bold{23}, 1351--1375.

  Viechtbauer W (2010),
  Conducting Meta-Analyses in R with the Metafor Package.
  \emph{Journal of Statistical Software}, \bold{36}, 1--48.
}

\author{Guido Schwarzer \email{sc@imbi.uni-freiburg.de}}

\seealso{\code{\link{update.meta}}, \code{\link{forest}}, \code{\link{funnel}}, \code{\link{metabias}}, \code{\link{metacont}}, \code{\link{metagen}}, \code{\link{metareg}}, \code{\link{print.meta}}}

\examples{
#
# Calculate odds ratio and confidence interval for a single study
#
metabin(10, 20, 15, 20, sm = "OR")

#
# Different results (due to handling of studies with double zeros)
#
metabin(0, 10, 0, 10, sm = "OR")
metabin(0, 10, 0, 10, sm = "OR", allstudies = TRUE)


#
# Use subset of Olkin (1995) to conduct meta-analysis based on inverse
# variance method (with risk ratio as summary measure)
#
data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = c(41, 47, 51, 59),
                 method = "Inverse")
summary(meta1)


#
# Use different subset of Olkin (1995)
#
meta2 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = Olkin95$year < 1970,
                 method = "Inverse", studlab = author)
summary(meta2)
forest(meta2)
#
# Meta-analysis with odds ratio as summary measure
#
meta3 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = Olkin95$year < 1970,
                 sm = "OR", method = "Inverse", studlab = author)
# Same meta-analysis result using 'update.meta' function
meta3 <- update(meta2, sm = "OR")
summary(meta3)
#
# Meta-analysis based on Mantel-Haenszel method
# (with odds ratio as summary measure)
#
meta4 <- update(meta3, method = "MH")
summary(meta4)
#
# Meta-analysis based on Peto method
# (only available for odds ratio as summary measure)
#
meta5 <- update(meta3, method = "Peto")
summary(meta5)


\dontrun{
#
# Meta-analysis using generalised linear mixed models
# (only if R packages 'metafor' and 'lme4' are available)
#
if (suppressMessages(require(metafor, quietly = TRUE, warn = FALSE)) &
    require(lme4, quietly = TRUE)) {
#
# Logistic regression model with (k = 4) fixed study effects
# (default: model.glmm = "UM.FS")
#
meta6 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = Olkin95$year < 1970,
                 method = "GLMM")
# Same results:
meta6 <- update(meta2, method = "GLMM")
summary(meta6)
#
# Mixed-effects logistic regression model with random study effects
# (warning message printed due to argument 'nAGQ')
#
meta7 <- update(meta6, model.glmm = "UM.RS")
#
# Use additional argument 'nAGQ' for internal call of 'rma.glmm' function
#
meta7 <- update(meta6, model.glmm = "UM.RS", nAGQ = 1)
summary(meta7)
#
# Generalised linear mixed model (conditional Hypergeometric-Normal)
# (R package 'BiasedUrn' must be available)
#
if (require(BiasedUrn, quietly = TRUE)) {
 meta8 <- update(meta6, model.glmm = "CM.EL")
 summary(meta8)
}
#
# Generalised linear mixed model (conditional Binomial-Normal)
#
meta9 <- update(meta6, model.glmm = "CM.AL")
summary(meta9)

#
# Logistic regression model with (k = 70) fixed study effects
# (about 18 seconds with Intel Core i7-3667U, 2.0GHz)
#
meta10 <- metabin(event.e, n.e, event.c, n.c,
                  data = Olkin95, method = "GLMM")
summary(meta10)
#
# Mixed-effects logistic regression model with random study effects
# - about 50 seconds with Intel Core i7-3667U, 2.0GHz
# - several warning messages, e.g. "failure to converge, ..."
#
summary(update(meta10, model.glmm = "UM.RS"))
#
# Conditional Hypergeometric-Normal GLMM
# - long computation time (about 12 minutes with Intel Core i7-3667U, 2.0GHz)
# - estimation problems for this very large dataset:
#   * warning that Choleski factorization of Hessian failed
#   * confidence interval for treatment effect smaller in random
#     effects model compared to fixed effect model
#
if (require(BiasedUrn, quietly = TRUE)) {
 system.time(meta11 <- update(meta10, model.glmm = "CM.EL"))
 summary(meta11)
}
#
# Generalised linear mixed model (conditional Binomial-Normal)
# (less than 1 second with Intel Core i7-3667U, 2.0GHz)
#
summary(update(meta10, model.glmm = "CM.AL"))
}
}
}
\keyword{htest}
