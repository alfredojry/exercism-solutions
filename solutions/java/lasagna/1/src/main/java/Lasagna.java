public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int time) {
        return new Lasagna().expectedMinutesInOven() - time;
    }

    public int preparationTimeInMinutes(int layers) {
        return 2 * layers;
    }

    public int totalTimeInMinutes(int layers, int time) {
        return time + (new Lasagna().preparationTimeInMinutes(layers));
    }
}
