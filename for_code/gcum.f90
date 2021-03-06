!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!                                                                      %
! Copyright (C) 2015 Adrian Martinez Vargas                            %
!                                                                      %
! This software may be modified and distributed under the terms        %
! of the MIT license.  See the LICENSE.txt file for details.           %
!                                                                      %
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!                                                                      %
! Copyright (C) 1996, The Board of Trustees of the Leland Stanford     %
! Junior University.  All rights reserved.                             %
!                                                                      %
! The programs in GSLIB are distributed in the hope that they will be  %
! useful, but WITHOUT ANY WARRANTY.  No author or distributor accepts  %
! responsibility to anyone for the consequences of using them or for   %
! whether they serve any particular purpose or work at all, unless he  %
! says so in writing.  Everyone is granted permission to copy, modify  %
! and redistribute the programs in GSLIB, but only under the condition %
! that this notice and the above copyright notice remain intact.       %
!                                                                      %
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!-----------------------------------------------------------------------
!
! The functions and subroutines below were modified from the
! version 2.0 of the gslib code written in fortran 77
! 
! The objective is to add functionality to GSLIB and to link 
! this code with python using f2py. It uses f90 code convention. 
! The arrays are dynamic and externally declared (from python)
!
! the code was converted from Fortran 77 to Fortran 90 using F2F.pl
! 
! for more information please refer to:
! - gslib77 source code: http://www.statios.com/software/gslib77_ls.tar.gz
! - GSLIB: Geostatistical Software Library and User's Guide. Second edition 
!   by Clayton V. Deutsch, Andre G. Journel, 1997.
! - F2PY Users Guide: http://docs.scipy.org/doc/numpy-dev/f2py/
! - F2F https://bitbucket.org/lemonlab/f2f
!-----------------------------------------------------------------------

real function gcum(x)
    !-----------------------------------------------------------------------

    ! Evaluate the standard normal cdf given a normal deviate x.  gcum is
    ! the area under a unit normal curve to the left of x.  The results are
    ! accurate only to about 5 decimal places.


    !-----------------------------------------------------------------------
    
    real :: x, z, e2
    
    z = x
    if(z < 0.) z = -z
    t    = 1./(1.+ 0.2316419*z)
    gcum = t*(0.31938153   + t*(-0.356563782 + t*(1.781477937 + &
    t*(-1.821255978 + t*1.330274429))))
    e2   = 0.

    !  6 standard deviations out gets treated as infinity:

    if(z <= 6.) e2 = exp(-z*z/2.)*0.3989422803
    gcum = 1.0- e2 * gcum
    if(x >= 0.) return
    gcum = 1.0 - gcum
    
    return
    
end function gcum


double precision function dgcum(x)
    !-----------------------------------------------------------------------

    ! Evaluate the standard normal cdf given a normal deviate x.  gcum is
    ! the area under a unit normal curve to the left of x.  The results are
    ! accurate only to about 5 decimal places.


    !-----------------------------------------------------------------------
    
    real*8 :: x, z, e2, t
    
    
    z = x
    if(z < 0.) z = -z
    t    = 1./(1.+ 0.2316419*z)
    dgcum = t*(0.31938153   + t*(-0.356563782 + t*(1.781477937 + &
    t*(-1.821255978 + t*1.330274429))))
    e2   = 0.

    !  6 standard deviations out gets treated as infinity:

    if(z <= 6.) e2 = exp(-z*z/2.)*0.3989422803
    dgcum = 1.0- e2 * dgcum
    if(x >= 0.) return
    dgcum = 1.0 - dgcum
    
    return
    
end function dgcum
