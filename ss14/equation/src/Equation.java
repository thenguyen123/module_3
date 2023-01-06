public class Equation {
    public static void main(String[] args) {

    }

    public static String equation(double a, double b, double c) {
        double temp = b * b - (4 * a * c);

        if (a != 0) {
            if (temp > 0) {
                double x = (((-b) + Math.sqrt(temp)) / (2 * a));
                double y = (((-b) - Math.sqrt(temp)) / (2 * a));
                return " phương trình có nghiệm một   "  +  x +  " phương trình có nghiệm hai " + y;
            } else if (temp == 0) {
                double x = -b / 2 * a;
                return " phương trình có một nghiệm " + x;
            } else if (temp < 0) {
                return " phương trình  vô nghiệm ";
            }
        } else {
            if (b == 0) {
                return "vô nghiệm";
            } else {
                return "phương trình có một nghiệm" + (-c / b);

            }
        }return " ";
    }
}
