Antenna Pattern Format (.txt)
The provided Stacked Patch antenna patterns are provided in .txt ASCII files, which consist of E(theta), and E(phi) components in magnitude (dB) and phase angle (degrees) format for each farfield point simulated. The first row consists of column labels (Theta Angle, Phi Angle, Abs(Gain), Abs(E(theta)), Phase(E(theta)), Abs(E(phi)), Phase(E(phi)), Axial Ratio.

Each row after the first contains the E(theta) and E(phi) information for each theta/phi coordinate, at the frequency noted in the filename in GHz.

This format is provided by CST Microwave Studio, and can be imported using a wide range of programs, such as Matlab, Excel, Spyder(python), or Octave.


Files associated with "Conformal Antenna Array Design using Aperture Synthesis and On-platform modelling" published in IEEE Access.

Stacked Patch Folder
farfield (f=3)[1].txt
farfield (f=3)[2].txt
farfield (f=3)[3].txt
farfield (f=3)[4].txt
farfield (f=3)[5].txt
farfield (f=3)[6].txt
farfield (f=3)[7].txt
farfield (f=3)[8].txt
farfield (f=6)[1].txt
farfield (f=6)[2].txt
farfield (f=6)[3].txt
farfield (f=6)[4].txt
farfield (f=6)[5].txt
farfield (f=6)[6].txt
farfield (f=6)[7].txt
farfield (f=6)[8].txt

Antenna Pattern Format (.dat)
The Conical monopole antenna patterns are provided in .dat files, which consist of E(theta), and E(phi) components in magnitude (dB) and phase angle (degrees) format for each farfield point measured. The measurement setup is defined in the first row of the .dat file.
•	Number of Phi planes
•	Phi Start Angle
•	Phi Stop Angle
•	Normalisation (dB)
•	Pattern Frequency (MHz)
Each row after the first consists of the theta angle for the measurement, E(theta) magnitude, E(theta) phase, E(phi) magnitude, and E(phi) phase.

This format is intended to allow efficient importing and use of antenna patterns with a wide range of programs, such as Matlab, Excel, Spyder(python), or Octave.

Conical Monopole Folder
BoomConicalCST6GHzElement1.dat
BoomConicalCST6GHzElement2.dat
BoomConicalCST6GHzElement3.dat
BoomConicalCST6GHzElement4.dat
BoomConicalCST6GHzElement5.dat
BoomConicalCST6GHzElement6.dat
BoomConicalCST6GHzElement7.dat
BoomConicalCST6GHzElement8.dat
These antenna patterns comprise the underlying model results for this paper, of a elements 1 to 8 of the stacked patch array, and elements 1 to 8 of the conical monopole array.

