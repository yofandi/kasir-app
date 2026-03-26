<?php
if (! function_exists('formatPrice')) {
    /**
     * @param mixed $str
     *
     * @return [type]
     */
    function formatPrice($str)
    {
        return 'Rp. ' . number_format($str, '0', '', '.');
    }
}
