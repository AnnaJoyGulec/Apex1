public class Study {
    public static void main() {
        Integer num = 5;
        Integer faktResult = faktoriyelCalculate(num);
        System.debug('5 Faktoriyel: ' + faktResult);
    }

    public static Integer faktoriyelCalculate(Integer n) {
        if (n == 0 || n == 1) {
            return 1;
        } else {
            return n * faktoriyelCalculate(n - 1);
        }
    }
}
