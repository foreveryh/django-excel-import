# -*- coding: utf-8 -*-
#根据两点（经纬度坐标）计算在地球上的距离
import math
EARTH_RADIUS_METER = 6378137.0
def deg2rad(d):
    """degree to radian"""
    return d*math.pi/180.0
def spherical_distance(f, t):
    """caculate the spherical distance of two points """
    print f, t
    flon = deg2rad(float(f[1]))
    flat = deg2rad(float(f[0]))
    tlon = deg2rad(float(t[1]))
    tlat = deg2rad(float(t[0]))
    con = math.sin(flat)*math.sin(tlat)
    con += math.cos(flat)*math.cos(tlat)*math.cos(flon - tlon)
    return math.acos(con)*EARTH_RADIUS_METER