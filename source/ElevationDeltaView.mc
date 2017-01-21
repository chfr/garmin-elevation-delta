using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class ElevationDeltaView extends Ui.SimpleDataField {

    hidden var mUnit = "m";
    hidden var mUnitFont = Gfx.FONT_TINY;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Elevation delta";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        if (info == null) {
            return "--";
        }

        var ascent = info.totalAscent;
        var descent = info.totalDescent;

        if (ascent == null || descent == null) {
            return "--";
        }

        var delta = ascent-descent;
        Sys.println("ascent: " + ascent + ", descent: " + descent + ", delta: " + delta);
        if (delta != null) {
            delta = delta.format("%.1f");
            return delta + " " + mUnit;
        } else {
            return "--";
        }
    }

}