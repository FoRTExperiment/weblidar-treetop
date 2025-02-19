#'Launch treetop application
#
#'@description This function launch the treetop application.
#'
#'@usage launchApp(...)
#'
#'@param ... additional parameters from the \code{\link[shiny:runApp]{runApp}} function in the \emph{shiny} package.
#'@return This function does not return.
#'@details The treetop shiny app will pop up for LiDAR data visualization, processing and analysis. Import a LiDAR-derived Canopy Height Model (CHM, as .tif, .asc or .img format) for custom data processing. Interrupt R to stop the application (usually by pressing Ctrl+C or Esc).
#'Individual trees are detected and their crown are delineated using methods described in Silva et al. (2016) and implemented in the \code{\link[lidR:silva2016]{silva2016}} function in the \emph{lidR} (Roussel et al. 2020) package.
#'
#'@references
#'Chang, W., Cheng, J., Allaire, J. J., Xie, Y., & McPherson, J. (2021). shiny: Web Application Framework for R.
#'\href{https://CRAN.R-project.org/package=shiny}{https://CRAN.R-project.org/package=shiny}
#'
#'Leite, R.V.; Silva, C.A.; Mohan, M.; Cardil, A.; Almeida, D.R.A.d.; Carvalho, S.d.P.C.e; Jaafar, W.S.W.M.; Guerra-Hernández, J.; Weiskittel, A.; Hudak, A.T.; Broadbent, E.N.; Prata, G.; Valbuena, R.; Leite, H.G.; Taquetti, M.F.; Soares, A.A.V.;
#'Scolforo, H.F.; Amaral, C.H.d.; Dalla Corte, A.P.; Klauberg, C. (2020). Individual Tree Attribute Estimation and Uniformity Assessment in Fast-Growing Eucalyptus spp. Forest Plantations Using Lidar and Linear Mixed-Effects Models. Remote Sens. 12, 3599.
#'\doi{10.3390/rs12213599}
#'
#'Roussel, J.R., Auty, D., Coops, N. C., Tompalski, P., Goodbody, T. R. H., Sánchez Meador, A., Bourdon, J.F., De Boissieu, F., Achim, A. (2020). lidR : An R package for analysis of Airborne Laser Scanning (ALS) data.
#'Remote Sensing of Environment, 251, 112061. \doi{10.1016/j.rse.2020.112061}
#'
#'Silva, C. A., Hudak, A. T., Vierling, L. A., Loudermilk, E. L., O’Brien, J. J., Hiers, J. K., Khosravipour, A. (2016). Imputation of Individual Longleaf Pine (Pinus palustris Mill.) Tree Attributes from Field and LiDAR Data. Canadian Journal of Remote Sensing, 42(5), 554–573.
#'\doi{10.1080/07038992.2016.1196582}
#'
#'@examples
#'\dontrun{
#'
#'# Launch treetop application
#'treetop::launchApp(launch.browser = TRUE)
#'
#'}
#'@export
#'@importFrom shiny runApp
#'@importFrom RColorBrewer brewer.pal
#'@importFrom spatstat.geom as.ppp
#'@importFrom spatstat.core envelope Kest Lest clarkevans.test
#'@import pryr
#'@importFrom sp coordinates SpatialPointsDataFrame SpatialPolygonsDataFrame merge proj4string
#'@importFrom raster raster projection res aggregate plot crop area intersect ncell cv 
#'@importFrom geometry convhulln
#'@importFrom rgdal writeOGR
#'@importFrom rgl rgl.triangles lines3d axes3d title3d rgl.cur rgl.close
#'@importFrom lidR find_trees silva2016
#'@importFrom stars st_as_stars
#'@importFrom rgl rglwidget
#'@importFrom rasterVis plot3D
#'@importFrom sf st_as_sf as_Spatial
launchApp<-function(...){
  appDir <- file.path(path.package("treetop", quiet=TRUE),"app")
  shiny::runApp(appDir, ...)
}
